FROM golang:latest as builder

RUN apt-get update && apt-get install git
WORKDIR /go-app
RUN git clone https://gist.github.com/52b1e7677e4e2a60e20432aa226a9b3e.git
WORKDIR /go-app/52b1e7677e4e2a60e20432aa226a9b3e
RUN go get github.com/gorilla/mux
RUN go build main.go


FROM debian:latest
COPY --from=builder /go-app/52b1e7677e4e2a60e20432aa226a9b3e /go-app
WORKDIR /go-app
RUN chmod +x main.go

ENTRYPOINT ["./main"]

