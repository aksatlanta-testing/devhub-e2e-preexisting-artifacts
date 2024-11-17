
{{- define "go-echod8492b32-bfb2-4db5-bfe5-916e7d404664.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod8492b32-bfb2-4db5-bfe5-916e7d404664.fullname" -}}
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


{{- define "go-echod8492b32-bfb2-4db5-bfe5-916e7d404664.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod8492b32-bfb2-4db5-bfe5-916e7d404664.labels" -}}
helm.sh/chart: {{ include "go-echod8492b32-bfb2-4db5-bfe5-916e7d404664.chart" . }}
{{ include "go-echod8492b32-bfb2-4db5-bfe5-916e7d404664.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod8492b32-bfb2-4db5-bfe5-916e7d404664.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod8492b32-bfb2-4db5-bfe5-916e7d404664.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}