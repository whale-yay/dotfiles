source $HOME/dotfiles/.env

_RESOLV_CONF='/etc/resolv.conf'

_DNS_STATE=$(grep ${_DNS} ${_RESOLV_CONF})

_DOCKER_PROXY_FILE=/etc/systemd/system/docker.service.d/http-proxy.conf

if [ -e _DOCKER_PROXY_FILE ]; then
  sudo touch _DOCKER_PROXY_FILE
fi

if [ -n "$_DNS_STATE" ] ; then
  cp ~/dotfiles/.env ~/.env

  sudo sed -i -e "s/PROXY=.*/PROXY=$http_proxy_for_sed\"/g" $_DOCKER_PROXY_FILE
  
  sudo systemctl daemon-reload
  sudo systemctl restart docker

  echo -e '\e[32mSet DOCKER proxy settings\e[m' >&2

else
  sed -i -e "s/=.*/=/g" ~/.env

  sudo sed -i -e "s/PROXY=.*/PROXY=\"/g" $_DOCKER_PROXY_FILE

  echo -e '\e[32mUnset DOCKER proxy settings\e[m' >&2
fi
