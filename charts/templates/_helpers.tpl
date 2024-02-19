{{/*
Expand the name of the chart.
*/}}
{{- define "go-echo65cd9bd0-d668-44dc-8236-6e83a8a47688.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "go-echo65cd9bd0-d668-44dc-8236-6e83a8a47688.fullname" -}}
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
{{- define "go-echo65cd9bd0-d668-44dc-8236-6e83a8a47688.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "go-echo65cd9bd0-d668-44dc-8236-6e83a8a47688.labels" -}}
helm.sh/chart: {{ include "go-echo65cd9bd0-d668-44dc-8236-6e83a8a47688.chart" . }}
{{ include "go-echo65cd9bd0-d668-44dc-8236-6e83a8a47688.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "go-echo65cd9bd0-d668-44dc-8236-6e83a8a47688.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo65cd9bd0-d668-44dc-8236-6e83a8a47688.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}