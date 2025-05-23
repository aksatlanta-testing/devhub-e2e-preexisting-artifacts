
{{- define "go-echo62a987ea-d6d6-4467-ad1c-2f0035fc0fbc.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo62a987ea-d6d6-4467-ad1c-2f0035fc0fbc.fullname" -}}
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


{{- define "go-echo62a987ea-d6d6-4467-ad1c-2f0035fc0fbc.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo62a987ea-d6d6-4467-ad1c-2f0035fc0fbc.labels" -}}
helm.sh/chart: {{ include "go-echo62a987ea-d6d6-4467-ad1c-2f0035fc0fbc.chart" . }}
{{ include "go-echo62a987ea-d6d6-4467-ad1c-2f0035fc0fbc.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo62a987ea-d6d6-4467-ad1c-2f0035fc0fbc.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo62a987ea-d6d6-4467-ad1c-2f0035fc0fbc.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}