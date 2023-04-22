package {{.PkgName}}

import (
	"net/http"

	"github.com/zeromicro/go-zero/rest/httpx"
	{{.ImportPackages}}
	"git.atcloudbox.com/089-group/allprompts/pro_prompts_server/chip/common"
)

func {{.HandlerName}}(svcCtx *svc.ServiceContext) http.HandlerFunc {
	return func(w http.ResponseWriter, r *http.Request) {
		{{if .HasRequest}}var req types.{{.RequestType}}
		if err := httpx.Parse(r, &req); err != nil {
            common.ResponseJson(r, w, nil, errors.ErrParam.Wrap(err))
            return
        }
        if err := validate.Validate(req); err != nil {
            common.ResponseJson(r, w, nil, errors.ErrParamValid.Wrap(err))
            return
        }

		{{end}}l := {{.LogicName}}.New{{.LogicType}}(r.Context(), svcCtx)
		{{if .HasResp}}resp, {{end}}err := l.{{.Call}}({{if .HasRequest}}&req{{end}})
		{{if .HasResp}}common.ResponseJson(r, w, resp, err){{else}}common.ResponseJson(r, w, nil, err){{end}}
	}
}
