_DOCKER_PROXY_FILE=/etc/systemd/system/docker.service.d/http-proxy.conf

_SET_PROXY(){
  export http_proxy="http://$1"
  export https_proxy="$http_proxy"
  export ftp_proxy="$http_proxy"
  export no_proxy='127.0.0.1,localhost'

  # docker settings
  git config --global http.proxy "$http_proxy"
  git config --global https.proxy "$http_proxy"
  
  # docker settings
  cp ~/dotfiles/.env ~/.env

  sudo sed -i -e "s/PROXY=.*/PROXY=$http_proxy_for_sed\"/g" $_DOCKER_PROXY_FILE

  sudo systemctl daemon-reload
  sudo systemctl restart docker

  echo -e '\e[36mSet proxy settings\e[m' >&2
}

_UNSET_PROXY(){
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
