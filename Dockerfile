FROM golang:alpine AS builder
RUN mkdir /app
ADD . /app/
WORKDIR /app
RUN go build -o hello hello.go


FROM alpine:latest
RUN mkdir /app
WORKDIR /app
COPY --from=builder /app/hello .
CMD ["./hello"]
