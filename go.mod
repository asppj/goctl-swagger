module github.com/zeromicro/goctl-swagger

go 1.16

require (
	github.com/grpc-ecosystem/grpc-gateway v1.16.0
	github.com/urfave/cli/v2 v2.11.0
	github.com/zeromicro/go-zero v1.5.1
	github.com/zeromicro/go-zero/tools/goctl v1.3.2
	golang.org/x/oauth2 v0.4.0
)

replace github.com/zeromicro/go-zero/tools/goctl => ./go-zero/tools/goctl
