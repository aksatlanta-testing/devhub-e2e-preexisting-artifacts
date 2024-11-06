
{{- define "go-echoce93ec1b-0d0f-4515-8006-3ce140315d1b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoce93ec1b-0d0f-4515-8006-3ce140315d1b.fullname" -}}
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


{{- define "go-echoce93ec1b-0d0f-4515-8006-3ce140315d1b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoce93ec1b-0d0f-4515-8006-3ce140315d1b.labels" -}}
helm.sh/chart: {{ include "go-echoce93ec1b-0d0f-4515-8006-3ce140315d1b.chart" . }}
{{ include "go-echoce93ec1b-0d0f-4515-8006-3ce140315d1b.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoce93ec1b-0d0f-4515-8006-3ce140315d1b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoce93ec1b-0d0f-4515-8006-3ce140315d1b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}