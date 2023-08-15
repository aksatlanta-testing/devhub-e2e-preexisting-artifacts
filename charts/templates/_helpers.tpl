{{/*
Expand the name of the chart.
*/}}
{{- define "go-echoa540f3fe-14b6-44ec-9c56-8f82036707fc.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "go-echoa540f3fe-14b6-44ec-9c56-8f82036707fc.fullname" -}}
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
{{- define "go-echoa540f3fe-14b6-44ec-9c56-8f82036707fc.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "go-echoa540f3fe-14b6-44ec-9c56-8f82036707fc.labels" -}}
helm.sh/chart: {{ include "go-echoa540f3fe-14b6-44ec-9c56-8f82036707fc.chart" . }}
{{ include "go-echoa540f3fe-14b6-44ec-9c56-8f82036707fc.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "go-echoa540f3fe-14b6-44ec-9c56-8f82036707fc.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa540f3fe-14b6-44ec-9c56-8f82036707fc.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}