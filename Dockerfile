FROM golang:alpine as builder

WORKDIR /go/src/app
COPY . .

RUN CGO_ENABLED=0 go build -o /app main.go

#Copiar o resultado gerado do build acima para o processo abaixo
FROM scratch
WORKDIR /app
COPY --from=builder /app .

CMD ["./app"]