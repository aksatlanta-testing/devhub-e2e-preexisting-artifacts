
{{- define "go-echoef84a011-b8fc-4a5c-ad03-1db1003ba9db.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoef84a011-b8fc-4a5c-ad03-1db1003ba9db.fullname" -}}
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


{{- define "go-echoef84a011-b8fc-4a5c-ad03-1db1003ba9db.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoef84a011-b8fc-4a5c-ad03-1db1003ba9db.labels" -}}
helm.sh/chart: {{ include "go-echoef84a011-b8fc-4a5c-ad03-1db1003ba9db.chart" . }}
{{ include "go-echoef84a011-b8fc-4a5c-ad03-1db1003ba9db.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoef84a011-b8fc-4a5c-ad03-1db1003ba9db.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoef84a011-b8fc-4a5c-ad03-1db1003ba9db.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}