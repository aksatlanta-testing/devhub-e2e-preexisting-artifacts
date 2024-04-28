{{/*
Expand the name of the chart.
*/}}
{{- define "go-echoccaf3521-e940-4d7f-91d1-0163bf4a4511.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "go-echoccaf3521-e940-4d7f-91d1-0163bf4a4511.fullname" -}}
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
{{- define "go-echoccaf3521-e940-4d7f-91d1-0163bf4a4511.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "go-echoccaf3521-e940-4d7f-91d1-0163bf4a4511.labels" -}}
helm.sh/chart: {{ include "go-echoccaf3521-e940-4d7f-91d1-0163bf4a4511.chart" . }}
{{ include "go-echoccaf3521-e940-4d7f-91d1-0163bf4a4511.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "go-echoccaf3521-e940-4d7f-91d1-0163bf4a4511.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoccaf3521-e940-4d7f-91d1-0163bf4a4511.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}