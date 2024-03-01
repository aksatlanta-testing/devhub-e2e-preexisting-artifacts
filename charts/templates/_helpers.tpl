{{/*
Expand the name of the chart.
*/}}
{{- define "go-echoceba3cf1-4859-4e64-9fd4-0b010d7a4828.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "go-echoceba3cf1-4859-4e64-9fd4-0b010d7a4828.fullname" -}}
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
{{- define "go-echoceba3cf1-4859-4e64-9fd4-0b010d7a4828.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "go-echoceba3cf1-4859-4e64-9fd4-0b010d7a4828.labels" -}}
helm.sh/chart: {{ include "go-echoceba3cf1-4859-4e64-9fd4-0b010d7a4828.chart" . }}
{{ include "go-echoceba3cf1-4859-4e64-9fd4-0b010d7a4828.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "go-echoceba3cf1-4859-4e64-9fd4-0b010d7a4828.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoceba3cf1-4859-4e64-9fd4-0b010d7a4828.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}