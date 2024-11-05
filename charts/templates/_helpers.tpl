
{{- define "go-echo67b88d9d-4cd4-41c3-ab32-d8f0dbb7e6e7.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo67b88d9d-4cd4-41c3-ab32-d8f0dbb7e6e7.fullname" -}}
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


{{- define "go-echo67b88d9d-4cd4-41c3-ab32-d8f0dbb7e6e7.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo67b88d9d-4cd4-41c3-ab32-d8f0dbb7e6e7.labels" -}}
helm.sh/chart: {{ include "go-echo67b88d9d-4cd4-41c3-ab32-d8f0dbb7e6e7.chart" . }}
{{ include "go-echo67b88d9d-4cd4-41c3-ab32-d8f0dbb7e6e7.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo67b88d9d-4cd4-41c3-ab32-d8f0dbb7e6e7.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo67b88d9d-4cd4-41c3-ab32-d8f0dbb7e6e7.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}