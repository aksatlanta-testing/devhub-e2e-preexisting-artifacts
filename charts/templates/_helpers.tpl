{{/*
Expand the name of the chart.
*/}}
{{- define "go-echofcdcce48-c0bb-43fa-b05e-7a44af378f8f.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "go-echofcdcce48-c0bb-43fa-b05e-7a44af378f8f.fullname" -}}
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
{{- define "go-echofcdcce48-c0bb-43fa-b05e-7a44af378f8f.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "go-echofcdcce48-c0bb-43fa-b05e-7a44af378f8f.labels" -}}
helm.sh/chart: {{ include "go-echofcdcce48-c0bb-43fa-b05e-7a44af378f8f.chart" . }}
{{ include "go-echofcdcce48-c0bb-43fa-b05e-7a44af378f8f.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "go-echofcdcce48-c0bb-43fa-b05e-7a44af378f8f.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echofcdcce48-c0bb-43fa-b05e-7a44af378f8f.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}