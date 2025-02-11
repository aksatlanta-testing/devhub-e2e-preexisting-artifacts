
{{- define "go-echocd7246ad-1c3a-42ca-b838-b9076fc8e030.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocd7246ad-1c3a-42ca-b838-b9076fc8e030.fullname" -}}
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


{{- define "go-echocd7246ad-1c3a-42ca-b838-b9076fc8e030.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocd7246ad-1c3a-42ca-b838-b9076fc8e030.labels" -}}
helm.sh/chart: {{ include "go-echocd7246ad-1c3a-42ca-b838-b9076fc8e030.chart" . }}
{{ include "go-echocd7246ad-1c3a-42ca-b838-b9076fc8e030.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echocd7246ad-1c3a-42ca-b838-b9076fc8e030.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echocd7246ad-1c3a-42ca-b838-b9076fc8e030.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}