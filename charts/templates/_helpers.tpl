
{{- define "go-echod2f536d4-8bc0-45c1-a6cf-9622253ad7b5.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod2f536d4-8bc0-45c1-a6cf-9622253ad7b5.fullname" -}}
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


{{- define "go-echod2f536d4-8bc0-45c1-a6cf-9622253ad7b5.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod2f536d4-8bc0-45c1-a6cf-9622253ad7b5.labels" -}}
helm.sh/chart: {{ include "go-echod2f536d4-8bc0-45c1-a6cf-9622253ad7b5.chart" . }}
{{ include "go-echod2f536d4-8bc0-45c1-a6cf-9622253ad7b5.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod2f536d4-8bc0-45c1-a6cf-9622253ad7b5.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod2f536d4-8bc0-45c1-a6cf-9622253ad7b5.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}