
{{- define "go-echoca5c0faf-47ef-4264-bf82-b07a9729ddd8.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoca5c0faf-47ef-4264-bf82-b07a9729ddd8.fullname" -}}
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


{{- define "go-echoca5c0faf-47ef-4264-bf82-b07a9729ddd8.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoca5c0faf-47ef-4264-bf82-b07a9729ddd8.labels" -}}
helm.sh/chart: {{ include "go-echoca5c0faf-47ef-4264-bf82-b07a9729ddd8.chart" . }}
{{ include "go-echoca5c0faf-47ef-4264-bf82-b07a9729ddd8.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoca5c0faf-47ef-4264-bf82-b07a9729ddd8.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoca5c0faf-47ef-4264-bf82-b07a9729ddd8.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}