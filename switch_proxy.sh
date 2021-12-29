source $HOME/dotfiles/.env

_RESOLV_CONF='/etc/resolv.conf'

_DNS_STATE=$(grep nameserver ${_RESOLV_CONF})

_LATEST_DNS_FILE='./dotfiles/tmp/dns_accessed_latest'

_DOCKER_PROXY_FILE='/etc/systemd/system/docker.service.d/http-proxy.conf'

if [ ! -f $_LATEST_DNS_FILE ]; then
  touch $_LATEST_DNS_FILE
fi

_LATEST_DNS="$(cat $_LATEST_DNS_FILE)"

#echo $_DNS_STATE $_LATEST_DNS
if [ "$_DNS_STATE" == "$_LATEST_DNS" ]; then
  :
else
  if [ "$_DNS_STATE" == "nameserver 127.0.0.53" ]; then
    UNSET_PROXY
  else
    SET_PROXY $_PROXY
  fi
fi

echo "$_DNS_STATE" >$_LATEST_DNS_FILE

function SET_PROXY(){
  export http_proxy="http://$1"
  export https_proxy="$http_proxy"
  export ftp_proxy="$http_proxy"
  export no_proxy='127.0.0.1,localhost'

  # docker settings
  git config --global http.proxy "$http_proxy"
  git config --global https.proxy "$http_proxy"
  
  echo "$_DNS_STATE" >$_LATEST_DNS_FILE

  # docker settings
  cp ~/dotfiles/.env ~/.env

  sudo sed -i -e "s/PROXY=.*/PROXY=$http_proxy_for_sed\"/g" $_DOCKER_PROXY_FILE

  sudo systemctl daemon-reload
  sudo systemctl restart docker

  echo -e '\e[36mSet proxy settings\e[m' >&2
}

function UNSET_PROXY(){
  #bash config
  export http_proxy=''
  export https_proxy=''
  export ftp_proxy=''
  export no_proxy=''


  #git config
  git config --global --unset http.proxy
  git config --global --unset https.proxy


  #docker config
  sed -i -e "s/=.*/=/g" ~/.env
  sudo sed -i -e "s/PROXY=.*/PROXY=\"/g" $_DOCKER_PROXY_FILE
  sudo systemctl daemon-reload
  sudo systemctl restart docker


  echo -e '\e[36mUnset proxy settings\e[m' >&2
}
