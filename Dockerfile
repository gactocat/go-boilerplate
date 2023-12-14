FROM golang:1.21.5-alpine

WORKDIR /usr/src/app
EXPOSE 3000

COPY go.mod go.sum ./
RUN go mod download && go mod verify

COPY . .
RUN go build -v -o /usr/local/bin/app ./...

CMD ["app"]


