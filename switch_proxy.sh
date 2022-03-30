. $HOME/dotfiles/.env
. $HOME/dotfiles/proxy_setting.sh

_RESOLV_CONF=/etc/resolv.conf

_DNS_STATE=$(grep nameserver ${_RESOLV_CONF})

_LATEST_DNS_FILE=$HOME/dotfiles/tmp/dns_accessed_latest

_DOCKER_PROXY_FILE=/etc/systemd/system/docker.service.d/http-proxy.conf

_LATEST_DNS=$(grep nameserver ${_LATEST_DNS_FILE})

#echo ${_DNS_STATE} ${_LATEST_DNS}

if [ "${_DNS_STATE}" = "${_LATEST_DNS}" ]; then
  :
else
  if [ "${_DNS_STATE}" = "nameserver 127.0.0.53" ]; then
    UNSET_PROXY
  else
    SET_PROXY $_PROXY
  fi
  echo "$_DNS_STATE" > ${_LATEST_DNS_FILE}
fi

