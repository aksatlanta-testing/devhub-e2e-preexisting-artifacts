
{{- define "go-echof09efcc2-5387-466c-ab59-3f8f2a40f64a.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof09efcc2-5387-466c-ab59-3f8f2a40f64a.fullname" -}}
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


{{- define "go-echof09efcc2-5387-466c-ab59-3f8f2a40f64a.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof09efcc2-5387-466c-ab59-3f8f2a40f64a.labels" -}}
helm.sh/chart: {{ include "go-echof09efcc2-5387-466c-ab59-3f8f2a40f64a.chart" . }}
{{ include "go-echof09efcc2-5387-466c-ab59-3f8f2a40f64a.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof09efcc2-5387-466c-ab59-3f8f2a40f64a.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof09efcc2-5387-466c-ab59-3f8f2a40f64a.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}