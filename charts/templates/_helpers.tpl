{{/*
Expand the name of the chart.
*/}}
{{- define "go-echocd89b05b-63a8-4d3c-8256-0a4c6a291fbb.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "go-echocd89b05b-63a8-4d3c-8256-0a4c6a291fbb.fullname" -}}
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
{{- define "go-echocd89b05b-63a8-4d3c-8256-0a4c6a291fbb.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "go-echocd89b05b-63a8-4d3c-8256-0a4c6a291fbb.labels" -}}
helm.sh/chart: {{ include "go-echocd89b05b-63a8-4d3c-8256-0a4c6a291fbb.chart" . }}
{{ include "go-echocd89b05b-63a8-4d3c-8256-0a4c6a291fbb.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "go-echocd89b05b-63a8-4d3c-8256-0a4c6a291fbb.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echocd89b05b-63a8-4d3c-8256-0a4c6a291fbb.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}