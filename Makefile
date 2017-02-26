.PHONY: all binary build release

all: binary build

binary:
	gcloud docker -- pull us.gcr.io/sharpspring-us/golang:build
	docker run \
		--rm \
		--volume $(shell pwd):/go/src/github.com/sharpspring/nginx_request_exporter \
		--workdir /go/src/github.com/sharpspring/nginx_request_exporter \
		us.gcr.io/sharpspring-us/golang:build sh -c " \
			go get \
				&& CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build --ldflags '-extldflags \"-static\"' -x -v"

build:
	docker build -t us.gcr.io/sharpspring-us/nginx_request_exporter:latest .

release:
	gcloud docker -- push us.gcr.io/sharpspring-us/searchsync:latest
