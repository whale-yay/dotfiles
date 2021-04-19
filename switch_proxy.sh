source $HOME/dotfiles/.env.sh

_RESOLV_CONF='/etc/resolv.conf'

_DNS_STATE=$(grep ${_DNS} ${_RESOLV_CONF})

if [ -n "$_DNS_STATE" ] ; then
  export http_proxy="http://${_PROXY}"
  export https_proxy="$http_proxy"
  export ftp_proxy="$http_proxy"
  export rsync_proxy="$http_proxy"
  export no_proxy='127.0.0.1,localhost'

  git config --global http.proxy "$http_proxy"
  git config --global https.proxy "$http_proxy"

  echo -e '\e[31mSet proxy settings\e[m' >&2

else
  export http_proxy=''
  export https_proxy=''
  export ftp_proxy=''
  export rsync_proxy=''
  export no_proxy=''

  git config --global --unset http.proxy
  git config --global --unset https.proxy

  echo -e '\e[31mUnset proxy settings\e[m' >&2
fi
