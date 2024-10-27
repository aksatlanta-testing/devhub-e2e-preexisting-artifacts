
{{- define "go-echofa9536f7-a8f1-4bc6-b240-9e74f56ce887.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofa9536f7-a8f1-4bc6-b240-9e74f56ce887.fullname" -}}
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


{{- define "go-echofa9536f7-a8f1-4bc6-b240-9e74f56ce887.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofa9536f7-a8f1-4bc6-b240-9e74f56ce887.labels" -}}
helm.sh/chart: {{ include "go-echofa9536f7-a8f1-4bc6-b240-9e74f56ce887.chart" . }}
{{ include "go-echofa9536f7-a8f1-4bc6-b240-9e74f56ce887.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echofa9536f7-a8f1-4bc6-b240-9e74f56ce887.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echofa9536f7-a8f1-4bc6-b240-9e74f56ce887.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}