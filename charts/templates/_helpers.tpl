
{{- define "go-echoaefb4f17-907a-4718-9854-2fe63e35ffce.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoaefb4f17-907a-4718-9854-2fe63e35ffce.fullname" -}}
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


{{- define "go-echoaefb4f17-907a-4718-9854-2fe63e35ffce.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoaefb4f17-907a-4718-9854-2fe63e35ffce.labels" -}}
helm.sh/chart: {{ include "go-echoaefb4f17-907a-4718-9854-2fe63e35ffce.chart" . }}
{{ include "go-echoaefb4f17-907a-4718-9854-2fe63e35ffce.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoaefb4f17-907a-4718-9854-2fe63e35ffce.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoaefb4f17-907a-4718-9854-2fe63e35ffce.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}