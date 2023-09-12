FROM golang:1.16 as builder

WORKDIR /app

COPY main.go .

RUN CGO_ENABLED=0 GOOS=linux go build -o app main.go

FROM scratch

WORKDIR /app

COPY --from=builder /app/app .

CMD [ "./app" ]