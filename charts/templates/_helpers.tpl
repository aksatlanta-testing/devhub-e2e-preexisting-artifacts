
{{- define "go-echo9d29f8b8-d31f-4bc6-ba03-6e71dbaf5b64.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo9d29f8b8-d31f-4bc6-ba03-6e71dbaf5b64.fullname" -}}
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


{{- define "go-echo9d29f8b8-d31f-4bc6-ba03-6e71dbaf5b64.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo9d29f8b8-d31f-4bc6-ba03-6e71dbaf5b64.labels" -}}
helm.sh/chart: {{ include "go-echo9d29f8b8-d31f-4bc6-ba03-6e71dbaf5b64.chart" . }}
{{ include "go-echo9d29f8b8-d31f-4bc6-ba03-6e71dbaf5b64.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo9d29f8b8-d31f-4bc6-ba03-6e71dbaf5b64.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo9d29f8b8-d31f-4bc6-ba03-6e71dbaf5b64.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}