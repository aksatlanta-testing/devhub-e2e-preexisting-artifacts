{{/*
Expand the name of the chart.
*/}}
{{- define "go-echobaadbb99-3d71-48d2-b3f0-5d7fbbcfeada.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "go-echobaadbb99-3d71-48d2-b3f0-5d7fbbcfeada.fullname" -}}
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
{{- define "go-echobaadbb99-3d71-48d2-b3f0-5d7fbbcfeada.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "go-echobaadbb99-3d71-48d2-b3f0-5d7fbbcfeada.labels" -}}
helm.sh/chart: {{ include "go-echobaadbb99-3d71-48d2-b3f0-5d7fbbcfeada.chart" . }}
{{ include "go-echobaadbb99-3d71-48d2-b3f0-5d7fbbcfeada.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "go-echobaadbb99-3d71-48d2-b3f0-5d7fbbcfeada.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echobaadbb99-3d71-48d2-b3f0-5d7fbbcfeada.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}