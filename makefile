run: build start

build:
	go test -v
	docker build . -t hello-world

start:
	docker run --rm -p 3000:3333 hello-world

curl:
	curl http://localhost:3000/