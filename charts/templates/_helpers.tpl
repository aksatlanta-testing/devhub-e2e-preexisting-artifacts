{{/*
Expand the name of the chart.
*/}}
{{- define "go-echodfabc09f-4c41-4e99-8f2e-54b838b42cef.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "go-echodfabc09f-4c41-4e99-8f2e-54b838b42cef.fullname" -}}
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
{{- define "go-echodfabc09f-4c41-4e99-8f2e-54b838b42cef.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "go-echodfabc09f-4c41-4e99-8f2e-54b838b42cef.labels" -}}
helm.sh/chart: {{ include "go-echodfabc09f-4c41-4e99-8f2e-54b838b42cef.chart" . }}
{{ include "go-echodfabc09f-4c41-4e99-8f2e-54b838b42cef.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "go-echodfabc09f-4c41-4e99-8f2e-54b838b42cef.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echodfabc09f-4c41-4e99-8f2e-54b838b42cef.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}