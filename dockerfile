# this dockerfile can be excuted by CI/CD systems on git push hooks to build a self contained executable
# inside a scratch container that can than be easily pushed to the cloud by the external script
FROM golang:latest as builder

# set the working directory so that go tools can succesfully use this source
WORKDIR /go/src/github.com/zanven42/telstra-helloworld

# copy our entire git repo into the gopath saving a go get to this project with commit hash details
COPY . .

# change the working directory to that of this project
WORKDIR /go/src/github.com/zanven42/telstra-helloworld

# now go get all dependencies and install them
RUN go get -d -v ./...
RUN go install -v ./...

# Build the project
RUN GOOS=linux GOARCH=386 go build -ldflags "-s" -a -installsuffix cgo -o app main.go

# output a scratch container with the final executable
FROM scratch
COPY --from=builder /go/src/github.com/zanven42/telstra-helloworld/app .
CMD ["./app"]