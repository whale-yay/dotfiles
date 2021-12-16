source $HOME/dotfiles/.env

_RESOLV_CONF='/etc/resolv.conf'

_DNS_STATE=$(grep ${_DNS} ${_RESOLV_CONF})

_LATEST_DNS="$(cat ~/dotfiles/temp/dns_accessed_latest)"

if [ "$_DNS_STATE" != "$_LATEST_DNS" ]; then
  source ~/dotfiles/switch_proxy_docker.sh
fi

if [ -n "$_DNS_STATE" ] ; then
  export http_proxy="http://${_PROXY}"
  export https_proxy="$http_proxy"
  export ftp_proxy="$http_proxy"
  export no_proxy='127.0.0.1,localhost'

  #git configの設定
  git config --global http.proxy "$http_proxy"
  git config --global https.proxy "$http_proxy"
  
  echo "$_DNS_STATE" > ~/dotfiles/temp/dns_accessed_latest

  echo -e '\e[36mSet proxy settings\e[m' >&2

else
  export http_proxy=''
  export https_proxy=''
  export ftp_proxy=''
  export no_proxy=''

  #git configの設定
  git config --global --unset http.proxy
  git config --global --unset https.proxy

  echo -e '\e[36mUnset proxy settings\e[m' >&2
fi
