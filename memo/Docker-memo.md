# Docker 

#### docker-compose up -d 
コンテナをバックグラウンド起動
#### docker exec -it (container) (bash等)
コンテナにttyを有効化する

#### docker-compose.yaml変更を反映
イメージ：再構築の必要なし

コンテナ：再構築の必要あり：docker-compose up -d

#### Dockerfileの変更を反映
イメージ：再構築の必要あり：docker-compose build

コンテナ：再構築の必要あり：docker-compose up -d

#### Dockerをクリーンアップする
```
docker stop $(docker ps -q)
docker rm $(docker ps -q -a)
docker rmi $(docker images -q)
```

#### Docker-Composeのすべてのイメージ、コンテナを削除
docker-compose down --rmi all --volumes --remove-orphans

### テスト環境ではdocker-composeの restart:Always と tty:True は使わない
restart:Always コンテナが10秒以上稼働していた場合、コンテナが終了すると再起動する　

ttyをTrueに設定するとコンテナに仮想端末を作らせてコンテナを終了させない

### Dockerでのプロキシの設定

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

### DockerfileでCMD["go", "run", "main.go"] docker-compose command: go run main,go どっちがいいの
https://ja.stackoverflow.com/q/30495

### docker-entrypoint-initdb.d の中でDBの初期設定を行う時
sqlでなくshでデータの挿入等行う 
sqlだと目的のデータベースに挿入してくれなかったりした気もする
