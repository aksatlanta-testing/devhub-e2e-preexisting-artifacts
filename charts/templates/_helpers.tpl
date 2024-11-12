
{{- define "go-echo8a9b40fe-e179-43a7-b67a-bff8ec9a12f9.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo8a9b40fe-e179-43a7-b67a-bff8ec9a12f9.fullname" -}}
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


{{- define "go-echo8a9b40fe-e179-43a7-b67a-bff8ec9a12f9.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo8a9b40fe-e179-43a7-b67a-bff8ec9a12f9.labels" -}}
helm.sh/chart: {{ include "go-echo8a9b40fe-e179-43a7-b67a-bff8ec9a12f9.chart" . }}
{{ include "go-echo8a9b40fe-e179-43a7-b67a-bff8ec9a12f9.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo8a9b40fe-e179-43a7-b67a-bff8ec9a12f9.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo8a9b40fe-e179-43a7-b67a-bff8ec9a12f9.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}