
{{- define "go-echob549fe45-7328-4b3a-9c6e-87d461784579.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob549fe45-7328-4b3a-9c6e-87d461784579.fullname" -}}
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


{{- define "go-echob549fe45-7328-4b3a-9c6e-87d461784579.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob549fe45-7328-4b3a-9c6e-87d461784579.labels" -}}
helm.sh/chart: {{ include "go-echob549fe45-7328-4b3a-9c6e-87d461784579.chart" . }}
{{ include "go-echob549fe45-7328-4b3a-9c6e-87d461784579.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echob549fe45-7328-4b3a-9c6e-87d461784579.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echob549fe45-7328-4b3a-9c6e-87d461784579.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}