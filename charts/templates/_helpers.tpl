
{{- define "go-echo1c824395-04a5-4af6-ae41-4b79b3f4f351.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo1c824395-04a5-4af6-ae41-4b79b3f4f351.fullname" -}}
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


{{- define "go-echo1c824395-04a5-4af6-ae41-4b79b3f4f351.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo1c824395-04a5-4af6-ae41-4b79b3f4f351.labels" -}}
helm.sh/chart: {{ include "go-echo1c824395-04a5-4af6-ae41-4b79b3f4f351.chart" . }}
{{ include "go-echo1c824395-04a5-4af6-ae41-4b79b3f4f351.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo1c824395-04a5-4af6-ae41-4b79b3f4f351.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo1c824395-04a5-4af6-ae41-4b79b3f4f351.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}