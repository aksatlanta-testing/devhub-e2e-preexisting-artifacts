
{{- define "go-echob1032ed6-4165-42cb-90b5-a5e822ef360a.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob1032ed6-4165-42cb-90b5-a5e822ef360a.fullname" -}}
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


{{- define "go-echob1032ed6-4165-42cb-90b5-a5e822ef360a.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob1032ed6-4165-42cb-90b5-a5e822ef360a.labels" -}}
helm.sh/chart: {{ include "go-echob1032ed6-4165-42cb-90b5-a5e822ef360a.chart" . }}
{{ include "go-echob1032ed6-4165-42cb-90b5-a5e822ef360a.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echob1032ed6-4165-42cb-90b5-a5e822ef360a.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echob1032ed6-4165-42cb-90b5-a5e822ef360a.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}