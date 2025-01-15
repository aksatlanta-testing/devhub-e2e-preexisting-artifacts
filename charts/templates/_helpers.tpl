
{{- define "go-echobd1bc290-4f7e-4aa8-9384-fe7beca78731.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobd1bc290-4f7e-4aa8-9384-fe7beca78731.fullname" -}}
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


{{- define "go-echobd1bc290-4f7e-4aa8-9384-fe7beca78731.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobd1bc290-4f7e-4aa8-9384-fe7beca78731.labels" -}}
helm.sh/chart: {{ include "go-echobd1bc290-4f7e-4aa8-9384-fe7beca78731.chart" . }}
{{ include "go-echobd1bc290-4f7e-4aa8-9384-fe7beca78731.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echobd1bc290-4f7e-4aa8-9384-fe7beca78731.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echobd1bc290-4f7e-4aa8-9384-fe7beca78731.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}