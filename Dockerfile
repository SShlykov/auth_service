FROM golang:1.21-rc-alpine
WORKDIR /app

COPY go.mod ./
RUN go mod download

COPY . ./

RUN go build -o /app/main .

EXPOSE 1323

CMD [ "/app/main" ]

