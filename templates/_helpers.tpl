{{- define "appname.name" -}}
{{- .Chart.Name | lower | trunc 40 -}}
{{- end -}}

{{- define "appname.fullname" -}}
{{- printf "%s-%s" .Chart.Name .Release.Name | lower | replace "." "-" | trunc 40 }}
{{- end -}}

{{- define "appname.release" -}}
{{- printf "%s-%s" .Values.global.version .Values.image.version | lower | replace "." "-" | trunc 40 }}
{{- end -}}

{{- define "appname.version" -}}
{{- .Values.global.version | lower  | trunc 40 -}}
{{- end -}}

{{- define "appname.dbs" -}}
{{- printf "%s_%s" .Chart.Name .Release.Name | lower | trunc 40 | replace "-" "_" | replace "." "_"}}
{{- end -}}