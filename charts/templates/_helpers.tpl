
{{- define "go-echo1c7860fc-4872-418e-a91e-e1948fe31233.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo1c7860fc-4872-418e-a91e-e1948fe31233.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}


{{- define "go-echo1c7860fc-4872-418e-a91e-e1948fe31233.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo1c7860fc-4872-418e-a91e-e1948fe31233.labels" -}}
helm.sh/chart: {{ include "go-echo1c7860fc-4872-418e-a91e-e1948fe31233.chart" . }}
{{ include "go-echo1c7860fc-4872-418e-a91e-e1948fe31233.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo1c7860fc-4872-418e-a91e-e1948fe31233.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo1c7860fc-4872-418e-a91e-e1948fe31233.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}