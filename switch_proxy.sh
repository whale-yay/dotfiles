source $HOME/.env.sh
export proxy=$_proxy_address

export http_proxy=""
export https_proxy=""
export ftp_proxy=""
export all_proxy=""
export no_proxy=""

function set_proxy () {
  export http_proxy="http://$proxy"
  export https_proxy="http://$proxy"
  export ftp_proxy="http://$proxy"
  export all_proxy="http://$proxy"
  export no_proxy="127.0.0.1,localhost"

  export HTTP_PROXY="http://$proxy"
  export HTTPS_PROXY="http://$proxy"
  export FTP_PROXY="http://$proxy"
  export ALL_PROXY="http://$proxy"
  export NO_PROXY="127.0.0.1,localhost"
  
  git config --global http.proxy "http://$proxy"
  git config --global https.proxy "http://$proxy"
}

function unset_proxy () {
  export http_proxy=""
  export https_proxy=""
  export ftp_proxy=""
  export all_proxy=""
  export no_proxy=""

  export HTTP_PROXY=""
  export HTTPS_PROXY=""
  export FTP_PROXY=""
  export ALL_PROXY=""
  export NO_PROXY=""
  
  git config --global --unset http.proxy
  git config --global --unset https.proxy
}


