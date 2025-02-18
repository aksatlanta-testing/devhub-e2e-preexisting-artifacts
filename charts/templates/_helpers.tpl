
{{- define "go-echoe87d5fcd-6277-41ba-9a9d-fc98eb9c3359.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe87d5fcd-6277-41ba-9a9d-fc98eb9c3359.fullname" -}}
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


{{- define "go-echoe87d5fcd-6277-41ba-9a9d-fc98eb9c3359.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe87d5fcd-6277-41ba-9a9d-fc98eb9c3359.labels" -}}
helm.sh/chart: {{ include "go-echoe87d5fcd-6277-41ba-9a9d-fc98eb9c3359.chart" . }}
{{ include "go-echoe87d5fcd-6277-41ba-9a9d-fc98eb9c3359.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoe87d5fcd-6277-41ba-9a9d-fc98eb9c3359.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoe87d5fcd-6277-41ba-9a9d-fc98eb9c3359.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}