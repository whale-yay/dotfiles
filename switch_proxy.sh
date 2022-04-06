. $HOME/dotfiles/.env
. $HOME/dotfiles/proxy_setting.sh

_LATEST_SSID_FILE=$HOME/dotfiles/tmp/latest_ssid

_CURRENT_SSID=$(nmcli --terse --fields CONNECTION dev status | grep ${_SSID})
_LATEST_SSID=$(cat ${_LATEST_SSID_FILE})

if [ "${_CURRENT_SSID}" = "${_LATEST_SSID}" ]; then
  :
else
  if [ "${_CURRENT_SSID}" = "" ]; then
    _UNSET_PROXY
  else
    _SET_PROXY $_PROXY
  fi
  echo "${_CURRENT_SSID}" > ${_LATEST_SSID_FILE}
fi

