
{{- define "go-echod0618415-b0ea-45c4-9725-1b54e4e57358.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod0618415-b0ea-45c4-9725-1b54e4e57358.fullname" -}}
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


{{- define "go-echod0618415-b0ea-45c4-9725-1b54e4e57358.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod0618415-b0ea-45c4-9725-1b54e4e57358.labels" -}}
helm.sh/chart: {{ include "go-echod0618415-b0ea-45c4-9725-1b54e4e57358.chart" . }}
{{ include "go-echod0618415-b0ea-45c4-9725-1b54e4e57358.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod0618415-b0ea-45c4-9725-1b54e4e57358.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod0618415-b0ea-45c4-9725-1b54e4e57358.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}