source $HOME/dotfiles/.env

_RESOLV_CONF='/etc/resolv.conf'

_DNS_STATE=$(grep ${_DNS} ${_RESOLV_CONF})

if [ -n "$_DNS_STATE" ] ; then
  export http_proxy="http://${_PROXY}"
  export https_proxy="$http_proxy"
  export ftp_proxy="$http_proxy"
  export no_proxy='127.0.0.1,localhost'

  #git configの設定
  git config --global http.proxy "$http_proxy"
  git config --global https.proxy "$http_proxy"
  
  #docker envファイルの上書き
  cp ~/dotfiles/.env ~/.env

  echo -e '\e[36mSet proxy settings\e[m' >&2

else
  export http_proxy=''
  export https_proxy=''
  export ftp_proxy=''
  export no_proxy=''

  #git configの設定
  git config --global --unset http.proxy
  git config --global --unset https.proxy

  #docker envファイルの削除
  rm ~/.env && touch ~/.env

  echo -e '\e[36mUnset proxy settings\e[m' >&2
fi
