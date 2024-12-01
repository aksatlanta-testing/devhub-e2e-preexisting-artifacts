
{{- define "go-echof145fa63-be79-4994-ae75-104755853a48.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof145fa63-be79-4994-ae75-104755853a48.fullname" -}}
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


{{- define "go-echof145fa63-be79-4994-ae75-104755853a48.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof145fa63-be79-4994-ae75-104755853a48.labels" -}}
helm.sh/chart: {{ include "go-echof145fa63-be79-4994-ae75-104755853a48.chart" . }}
{{ include "go-echof145fa63-be79-4994-ae75-104755853a48.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof145fa63-be79-4994-ae75-104755853a48.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof145fa63-be79-4994-ae75-104755853a48.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}