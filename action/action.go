package action

import (
	"path/filepath"

	"github.com/urfave/cli/v2"

	"github.com/zeromicro/go-zero/tools/goctl/api/parser"
	"github.com/zeromicro/go-zero/tools/goctl/plugin"
	"github.com/zeromicro/go-zero/tools/goctl/util/pathx"
	"github.com/zeromicro/goctl-swagger/generate"
)

func Generator(ctx *cli.Context) error {
	fileName := ctx.String("filename")

	if len(fileName) == 0 {
		fileName = "rest.swagger.json"
	}

	// p, err := plugin.NewPlugin()
	// if err != nil {
	// 	return err
	// }
	apiVar := ctx.String("api")
	dirVar := ctx.String("dir")
	styleVar := ctx.String("style")
	p, err := prepareArgs(apiVar, dirVar, styleVar)
	if err != nil {
		return err
	}
	basepath := ctx.String("basepath")
	host := ctx.String("host")

	return generate.Do(fileName, host, basepath, p)
}

// goctl api plugin -plugin goctl-swagger="swagger -filename $(CHIP_DIR)/docs/swagger.json -host localhost:8888 -basepath /" -api  $(CHIP_DIR)/docs/main.api -dir .
func prepareArgs(apiPath, varStringDir, varStringStyle string) (*plugin.Plugin, error) {

	var transferData = &plugin.Plugin{}
	if len(apiPath) > 0 && pathx.FileExists(apiPath) {
		api, err := parser.Parse(apiPath)
		if err != nil {
			return nil, err
		}

		transferData.Api = api
	}

	absApiFilePath, err := filepath.Abs(apiPath)
	if err != nil {
		return nil, err
	}

	transferData.ApiFilePath = absApiFilePath
	dirAbs, err := filepath.Abs(varStringDir)
	if err != nil {
		return nil, err
	}

	transferData.Dir = dirAbs
	transferData.Style = varStringStyle
	return transferData, nil
}
