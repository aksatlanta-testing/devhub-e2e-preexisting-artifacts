{{/*
Expand the name of the chart.
*/}}
{{- define "go-echodee76c73-d84c-4d6e-b98c-556a79b1d08d.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "go-echodee76c73-d84c-4d6e-b98c-556a79b1d08d.fullname" -}}
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
{{- define "go-echodee76c73-d84c-4d6e-b98c-556a79b1d08d.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "go-echodee76c73-d84c-4d6e-b98c-556a79b1d08d.labels" -}}
helm.sh/chart: {{ include "go-echodee76c73-d84c-4d6e-b98c-556a79b1d08d.chart" . }}
{{ include "go-echodee76c73-d84c-4d6e-b98c-556a79b1d08d.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "go-echodee76c73-d84c-4d6e-b98c-556a79b1d08d.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echodee76c73-d84c-4d6e-b98c-556a79b1d08d.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}