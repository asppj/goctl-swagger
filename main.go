package main

import (
	"fmt"
	"os"
	"runtime"

	"github.com/urfave/cli/v2"
	"github.com/zeromicro/goctl-swagger/action"
)

var (
	version  = "20220621"
	commands = []*cli.Command{
		{
			Name:   "swagger",
			Usage:  "generates swagger.json",
			Action: action.Generator,
			Flags: []cli.Flag{
				&cli.StringFlag{
					Name:        "host",
					Usage:       "api request address",
					DefaultText: "localhost:8989",
				},
				&cli.StringFlag{
					Name:        "basepath",
					Usage:       "url request prefix",
					DefaultText: "/",
				},
				&cli.StringFlag{
					Name:        "filename",
					Usage:       "swagger save file name",
					DefaultText: "main.swagger.yaml",
				},
				&cli.StringFlag{
					Name:  "api",
					Usage: "main.api",
				},
				&cli.StringFlag{
					Name:  "dir",
					Usage: ".",
				},
				&cli.StringFlag{
					Name:        "style",
					Usage:       "",
					DefaultText: "goZero",
				},
				&cli.StringFlag{
					Name:        "auth",
					Usage:       "authorization",
					DefaultText: "Authorization",
				},
			},
		},
	}
)

func main() {
	app := cli.NewApp()
	app.Usage = "a plugin of goctl to generate swagger.json"
	app.Version = fmt.Sprintf("%s %s/%s", version, runtime.GOOS, runtime.GOARCH)
	app.Commands = commands
	if err := app.Run(os.Args); err != nil {
		fmt.Printf("goctl-swagger: %+v\n", err)
	}
}

// goctl api plugin -plugin goctl-swagger="swagger -filename $(CHIP_DIR)/docs/swagger.json -host localhost:8888 -basepath /" -api  $(CHIP_DIR)/docs/main.api -dir .
// func prepareArgs(apiPath, varStringDir, varStringStyle string) (*plugin.Plugin, error) {

// 	var transferData = &plugin.Plugin{}
// 	if len(apiPath) > 0 && pathx.FileExists(apiPath) {
// 		api, err := parser.Parse(apiPath)
// 		if err != nil {
// 			return nil, err
// 		}

// 		transferData.Api = api
// 	}

// 	absApiFilePath, err := filepath.Abs(apiPath)
// 	if err != nil {
// 		return nil, err
// 	}

// 	transferData.ApiFilePath = absApiFilePath
// 	dirAbs, err := filepath.Abs(varStringDir)
// 	if err != nil {
// 		return nil, err
// 	}

// 	transferData.Dir = dirAbs
// 	transferData.Style = varStringStyle
// 	return transferData, nil
// }
