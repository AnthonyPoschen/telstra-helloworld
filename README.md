# telstra-helloworld
hello world microservice docker application

## Setup
to clone and test the service works
```
git clone http://github.com/zanven42/telstra-helloworld .
go test -v
docker build . -t hello-world
docker run --rm -p 3000:3333 hello-world
curl http://localhost:3000/
```
