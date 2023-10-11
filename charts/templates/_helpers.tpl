{{/*
Expand the name of the chart.
*/}}
{{- define "go-echodde855c0-ed9d-49b6-9f69-10ba8df24740.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "go-echodde855c0-ed9d-49b6-9f69-10ba8df24740.fullname" -}}
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
{{- define "go-echodde855c0-ed9d-49b6-9f69-10ba8df24740.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "go-echodde855c0-ed9d-49b6-9f69-10ba8df24740.labels" -}}
helm.sh/chart: {{ include "go-echodde855c0-ed9d-49b6-9f69-10ba8df24740.chart" . }}
{{ include "go-echodde855c0-ed9d-49b6-9f69-10ba8df24740.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "go-echodde855c0-ed9d-49b6-9f69-10ba8df24740.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echodde855c0-ed9d-49b6-9f69-10ba8df24740.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}