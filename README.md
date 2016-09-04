Self-Hosted gpodder.net
=======================

Requirements:
 - docker
 - docker-compose

Set a random secret key:
```
$ echo "SECRET_KEY=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)" > .env
```

Start the containers:
```
$ docker-compose up -d
```
