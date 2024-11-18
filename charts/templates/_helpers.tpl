
{{- define "go-echo8b63a4cf-a367-431d-9472-577b4be5e8fc.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo8b63a4cf-a367-431d-9472-577b4be5e8fc.fullname" -}}
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


{{- define "go-echo8b63a4cf-a367-431d-9472-577b4be5e8fc.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo8b63a4cf-a367-431d-9472-577b4be5e8fc.labels" -}}
helm.sh/chart: {{ include "go-echo8b63a4cf-a367-431d-9472-577b4be5e8fc.chart" . }}
{{ include "go-echo8b63a4cf-a367-431d-9472-577b4be5e8fc.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo8b63a4cf-a367-431d-9472-577b4be5e8fc.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo8b63a4cf-a367-431d-9472-577b4be5e8fc.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}