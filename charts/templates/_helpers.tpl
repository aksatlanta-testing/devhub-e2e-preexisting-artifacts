{{/*
Expand the name of the chart.
*/}}
{{- define "go-echoff76e615-afb4-4e83-9054-7e24afa57269.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "go-echoff76e615-afb4-4e83-9054-7e24afa57269.fullname" -}}
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
{{- define "go-echoff76e615-afb4-4e83-9054-7e24afa57269.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "go-echoff76e615-afb4-4e83-9054-7e24afa57269.labels" -}}
helm.sh/chart: {{ include "go-echoff76e615-afb4-4e83-9054-7e24afa57269.chart" . }}
{{ include "go-echoff76e615-afb4-4e83-9054-7e24afa57269.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "go-echoff76e615-afb4-4e83-9054-7e24afa57269.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoff76e615-afb4-4e83-9054-7e24afa57269.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}