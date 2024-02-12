FROM alpine:3.19.1

ENV CONNECTION_STRING "mongodb://localhost:27017/database"
ENV LOG_LEVEL "info"
ENV MONGO_PORT 27018
ENV MONGO_USERNAME "user"
ENV MONGO_PASSWORD "password"

RUN apk add --no-cache go

ENV GOROOT /usr/lib/go
ENV GOPATH /go
ENV PATH /go/bin:$PATH

RUN mkdir -p ${GOPATH}/src ${GOPATH}/bin

RUN go install github.com/coinbase/mongobetween@latest

CMD mongobetween -loglevel "${LOG_LEVEL}" -username "${MONGO_USERNAME}" -password "${MONGO_PASSWORD}" ":${MONGO_PORT}=${CONNECTION_STRING}"
