
{{- define "go-echobbe34829-2704-4222-88b6-f4cef56f4b49.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobbe34829-2704-4222-88b6-f4cef56f4b49.fullname" -}}
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


{{- define "go-echobbe34829-2704-4222-88b6-f4cef56f4b49.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobbe34829-2704-4222-88b6-f4cef56f4b49.labels" -}}
helm.sh/chart: {{ include "go-echobbe34829-2704-4222-88b6-f4cef56f4b49.chart" . }}
{{ include "go-echobbe34829-2704-4222-88b6-f4cef56f4b49.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echobbe34829-2704-4222-88b6-f4cef56f4b49.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echobbe34829-2704-4222-88b6-f4cef56f4b49.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}