
{{- define "go-echod000f3ca-4144-4dc6-9a1a-0d34f6746114.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod000f3ca-4144-4dc6-9a1a-0d34f6746114.fullname" -}}
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


{{- define "go-echod000f3ca-4144-4dc6-9a1a-0d34f6746114.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod000f3ca-4144-4dc6-9a1a-0d34f6746114.labels" -}}
helm.sh/chart: {{ include "go-echod000f3ca-4144-4dc6-9a1a-0d34f6746114.chart" . }}
{{ include "go-echod000f3ca-4144-4dc6-9a1a-0d34f6746114.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod000f3ca-4144-4dc6-9a1a-0d34f6746114.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod000f3ca-4144-4dc6-9a1a-0d34f6746114.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}