
{{- define "go-echob56e2c57-1c72-4aed-b801-63e1bd4f0b07.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob56e2c57-1c72-4aed-b801-63e1bd4f0b07.fullname" -}}
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


{{- define "go-echob56e2c57-1c72-4aed-b801-63e1bd4f0b07.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob56e2c57-1c72-4aed-b801-63e1bd4f0b07.labels" -}}
helm.sh/chart: {{ include "go-echob56e2c57-1c72-4aed-b801-63e1bd4f0b07.chart" . }}
{{ include "go-echob56e2c57-1c72-4aed-b801-63e1bd4f0b07.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echob56e2c57-1c72-4aed-b801-63e1bd4f0b07.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echob56e2c57-1c72-4aed-b801-63e1bd4f0b07.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}