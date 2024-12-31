
{{- define "go-echofa8d32af-7e52-4f56-89fc-d250af4d5135.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofa8d32af-7e52-4f56-89fc-d250af4d5135.fullname" -}}
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


{{- define "go-echofa8d32af-7e52-4f56-89fc-d250af4d5135.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofa8d32af-7e52-4f56-89fc-d250af4d5135.labels" -}}
helm.sh/chart: {{ include "go-echofa8d32af-7e52-4f56-89fc-d250af4d5135.chart" . }}
{{ include "go-echofa8d32af-7e52-4f56-89fc-d250af4d5135.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echofa8d32af-7e52-4f56-89fc-d250af4d5135.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echofa8d32af-7e52-4f56-89fc-d250af4d5135.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}