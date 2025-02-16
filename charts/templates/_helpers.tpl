
{{- define "go-echo8d400c85-d4de-49cc-94b7-6adfe5f54738.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo8d400c85-d4de-49cc-94b7-6adfe5f54738.fullname" -}}
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


{{- define "go-echo8d400c85-d4de-49cc-94b7-6adfe5f54738.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo8d400c85-d4de-49cc-94b7-6adfe5f54738.labels" -}}
helm.sh/chart: {{ include "go-echo8d400c85-d4de-49cc-94b7-6adfe5f54738.chart" . }}
{{ include "go-echo8d400c85-d4de-49cc-94b7-6adfe5f54738.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo8d400c85-d4de-49cc-94b7-6adfe5f54738.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo8d400c85-d4de-49cc-94b7-6adfe5f54738.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}