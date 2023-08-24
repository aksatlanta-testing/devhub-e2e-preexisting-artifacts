{{/*
Expand the name of the chart.
*/}}
{{- define "go-echoebf21cc1-cf56-47d7-a41c-c31648622ddd.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "go-echoebf21cc1-cf56-47d7-a41c-c31648622ddd.fullname" -}}
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

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "go-echoebf21cc1-cf56-47d7-a41c-c31648622ddd.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "go-echoebf21cc1-cf56-47d7-a41c-c31648622ddd.labels" -}}
helm.sh/chart: {{ include "go-echoebf21cc1-cf56-47d7-a41c-c31648622ddd.chart" . }}
{{ include "go-echoebf21cc1-cf56-47d7-a41c-c31648622ddd.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "go-echoebf21cc1-cf56-47d7-a41c-c31648622ddd.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoebf21cc1-cf56-47d7-a41c-c31648622ddd.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}