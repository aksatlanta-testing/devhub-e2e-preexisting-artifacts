{{/*
Expand the name of the chart.
*/}}
{{- define "go-echo920a1a75-5b82-44d3-a0b7-9d8ac788fbfc.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "go-echo920a1a75-5b82-44d3-a0b7-9d8ac788fbfc.fullname" -}}
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
{{- define "go-echo920a1a75-5b82-44d3-a0b7-9d8ac788fbfc.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "go-echo920a1a75-5b82-44d3-a0b7-9d8ac788fbfc.labels" -}}
helm.sh/chart: {{ include "go-echo920a1a75-5b82-44d3-a0b7-9d8ac788fbfc.chart" . }}
{{ include "go-echo920a1a75-5b82-44d3-a0b7-9d8ac788fbfc.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "go-echo920a1a75-5b82-44d3-a0b7-9d8ac788fbfc.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo920a1a75-5b82-44d3-a0b7-9d8ac788fbfc.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}