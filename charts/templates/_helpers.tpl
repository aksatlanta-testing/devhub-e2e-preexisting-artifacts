
{{- define "go-echofe6712a5-ff64-4303-8206-e3ba6667f521.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofe6712a5-ff64-4303-8206-e3ba6667f521.fullname" -}}
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


{{- define "go-echofe6712a5-ff64-4303-8206-e3ba6667f521.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofe6712a5-ff64-4303-8206-e3ba6667f521.labels" -}}
helm.sh/chart: {{ include "go-echofe6712a5-ff64-4303-8206-e3ba6667f521.chart" . }}
{{ include "go-echofe6712a5-ff64-4303-8206-e3ba6667f521.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echofe6712a5-ff64-4303-8206-e3ba6667f521.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echofe6712a5-ff64-4303-8206-e3ba6667f521.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}