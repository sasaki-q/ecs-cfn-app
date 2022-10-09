FROM --platform=linux/x86_64 golang:1.18.6-alpine3.16 AS builder

RUN apk update && \
    apk --no-cache add git

WORKDIR /app
COPY . .

RUN go mod tidy && \
    go build -o main main.go

FROM alpine:3.16
WORKDIR /app
COPY --from=builder /app/main .

ENV PORTS=8080
EXPOSE 8080

CMD ["/app/main"]