efb-wechat-docker
EFB WeChat Slave Docker Ver. 

## build

* use docker hub ci version

```
docker pull mikubill/efbwechat
```

* build it locally

```
git clone https://github.com/mikubill/efb-wechat-docker.git
cd efb-wechat-docker && docker build -t mikubill/efbwechat .
```

## usage

* step 1

```
docker run -d -t --name "efbwechat" -e TOKEN={} -e ADMIN={} mikubill/efbwechat
```

TOKEN: Telegram Bot Token (@botfather)

ADMIN: Your Telegram ID (@idbot)

* step 2

```
docker logs -f efbwechat
```

Scan the QRCode to login
