
{{- define "go-echo9479dc91-2b18-42a6-8ad1-5bf5c6e5dcbc.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo9479dc91-2b18-42a6-8ad1-5bf5c6e5dcbc.fullname" -}}
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


{{- define "go-echo9479dc91-2b18-42a6-8ad1-5bf5c6e5dcbc.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo9479dc91-2b18-42a6-8ad1-5bf5c6e5dcbc.labels" -}}
helm.sh/chart: {{ include "go-echo9479dc91-2b18-42a6-8ad1-5bf5c6e5dcbc.chart" . }}
{{ include "go-echo9479dc91-2b18-42a6-8ad1-5bf5c6e5dcbc.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo9479dc91-2b18-42a6-8ad1-5bf5c6e5dcbc.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo9479dc91-2b18-42a6-8ad1-5bf5c6e5dcbc.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}