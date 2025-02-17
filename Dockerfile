FROM golang:1.20-alpine as builder
WORKDIR /app
COPY . .
# ENV GO111MODULE=on \
#     CGO_ENABLED=0 \
#     GOOS=linux \
#     GOARCH=amd64 \
# 	GOPROXY="https://goproxy.cn,direct"
RUN go build 


FROM alpine:latest
WORKDIR /app
COPY --from=builder /app/chatgpt-arkose-token-api .
EXPOSE 8080
CMD [ "/app/chatgpt-arkose-token-api" ]
