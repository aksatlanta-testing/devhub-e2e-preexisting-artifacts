
{{- define "go-echodfb7dbcf-5861-4a59-91d7-9b9cef9dd68a.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodfb7dbcf-5861-4a59-91d7-9b9cef9dd68a.fullname" -}}
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


{{- define "go-echodfb7dbcf-5861-4a59-91d7-9b9cef9dd68a.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodfb7dbcf-5861-4a59-91d7-9b9cef9dd68a.labels" -}}
helm.sh/chart: {{ include "go-echodfb7dbcf-5861-4a59-91d7-9b9cef9dd68a.chart" . }}
{{ include "go-echodfb7dbcf-5861-4a59-91d7-9b9cef9dd68a.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echodfb7dbcf-5861-4a59-91d7-9b9cef9dd68a.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echodfb7dbcf-5861-4a59-91d7-9b9cef9dd68a.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}