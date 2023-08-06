{{/*
Expand the name of the chart.
*/}}
{{- define "go-echo039d9920-9ac2-4c5b-9bbb-81d95b18e642.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "go-echo039d9920-9ac2-4c5b-9bbb-81d95b18e642.fullname" -}}
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
{{- define "go-echo039d9920-9ac2-4c5b-9bbb-81d95b18e642.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "go-echo039d9920-9ac2-4c5b-9bbb-81d95b18e642.labels" -}}
helm.sh/chart: {{ include "go-echo039d9920-9ac2-4c5b-9bbb-81d95b18e642.chart" . }}
{{ include "go-echo039d9920-9ac2-4c5b-9bbb-81d95b18e642.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "go-echo039d9920-9ac2-4c5b-9bbb-81d95b18e642.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo039d9920-9ac2-4c5b-9bbb-81d95b18e642.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}