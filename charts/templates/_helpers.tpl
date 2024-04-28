{{/*
Expand the name of the chart.
*/}}
{{- define "go-echobde80723-d5a7-4ebf-b64a-6117b201caba.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "go-echobde80723-d5a7-4ebf-b64a-6117b201caba.fullname" -}}
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
{{- define "go-echobde80723-d5a7-4ebf-b64a-6117b201caba.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "go-echobde80723-d5a7-4ebf-b64a-6117b201caba.labels" -}}
helm.sh/chart: {{ include "go-echobde80723-d5a7-4ebf-b64a-6117b201caba.chart" . }}
{{ include "go-echobde80723-d5a7-4ebf-b64a-6117b201caba.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "go-echobde80723-d5a7-4ebf-b64a-6117b201caba.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echobde80723-d5a7-4ebf-b64a-6117b201caba.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}