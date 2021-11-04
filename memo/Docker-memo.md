# Docker 

### docker-compose up -d 
コンテナをバックグラウンド起動
### docker exec -it (container) (bash等)
コンテナにttyを有効化する

### docker-compose.yaml変更を反映
イメージ：再構築の必要なし
コンテナ：再構築の必要あり：docker-compose up -d

### Dockerfileの変更を反映
イメージ：再構築の必要あり：docker-compose build
コンテナ：再構築の必要あり：docker-compose up -d

### すべてのコンテナを停止する
docker stop $(docker ps -q)

### すべてのコンテナを削除（停止中のみ）
docker rm $(docker ps -q -a)

### Docker-Composeのすべてのイメージ、コンテナを削除
docker-compose down --rmi all --volumes --remove-orphans

### テスト環境ではdocker-composeの restart:Always と tty:True は使わない
restart:Always コンテナが10秒以上稼働していた場合、コンテナが終了すると再起動する　
ttyをTrueに設定するとコンテナに仮想端末を作らせてコンテナを終了させない

### Dockerでのプロキシの設定
※認証プロキシの場合は http://USER:PASSWORD@url.com:8080 のようにする

/etc/systemd/system/docker.service.d/http-proxy.conf
```
[Service]
Environment = 'http_proxy=http://192.168.0.10:8080' 'https_proxy=http://192.168.0.10:8080'
```
~/.docker/config.json
```
{
 "proxies":
 {
   "default":
   {
     "httpProxy": "http://192.168.0.10:8080",
     "httpsProxy": "http://192.168.0.10:8080"
   }
 }
}
```

docker-compose.yml同層で ~/dotfiles/.env へのシンボリックリンクを貼る
```
ln -s ~/dotfiles/.env path/to/directory
```
