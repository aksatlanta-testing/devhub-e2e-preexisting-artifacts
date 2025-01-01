
{{- define "go-echob88c89ef-4c41-4a7c-9095-a184940fe40b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob88c89ef-4c41-4a7c-9095-a184940fe40b.fullname" -}}
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


{{- define "go-echob88c89ef-4c41-4a7c-9095-a184940fe40b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob88c89ef-4c41-4a7c-9095-a184940fe40b.labels" -}}
helm.sh/chart: {{ include "go-echob88c89ef-4c41-4a7c-9095-a184940fe40b.chart" . }}
{{ include "go-echob88c89ef-4c41-4a7c-9095-a184940fe40b.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echob88c89ef-4c41-4a7c-9095-a184940fe40b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echob88c89ef-4c41-4a7c-9095-a184940fe40b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}