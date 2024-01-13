{{/*
Expand the name of the chart.
*/}}
{{- define "go-echo5f445b1d-5b7f-47d1-b566-345679a67bda.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "go-echo5f445b1d-5b7f-47d1-b566-345679a67bda.fullname" -}}
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
{{- define "go-echo5f445b1d-5b7f-47d1-b566-345679a67bda.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "go-echo5f445b1d-5b7f-47d1-b566-345679a67bda.labels" -}}
helm.sh/chart: {{ include "go-echo5f445b1d-5b7f-47d1-b566-345679a67bda.chart" . }}
{{ include "go-echo5f445b1d-5b7f-47d1-b566-345679a67bda.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "go-echo5f445b1d-5b7f-47d1-b566-345679a67bda.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo5f445b1d-5b7f-47d1-b566-345679a67bda.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}