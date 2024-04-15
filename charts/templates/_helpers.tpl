{{/*
Expand the name of the chart.
*/}}
{{- define "go-echoba714e6a-c7f2-4a9b-9992-e7c99c11cbee.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "go-echoba714e6a-c7f2-4a9b-9992-e7c99c11cbee.fullname" -}}
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
{{- define "go-echoba714e6a-c7f2-4a9b-9992-e7c99c11cbee.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "go-echoba714e6a-c7f2-4a9b-9992-e7c99c11cbee.labels" -}}
helm.sh/chart: {{ include "go-echoba714e6a-c7f2-4a9b-9992-e7c99c11cbee.chart" . }}
{{ include "go-echoba714e6a-c7f2-4a9b-9992-e7c99c11cbee.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "go-echoba714e6a-c7f2-4a9b-9992-e7c99c11cbee.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoba714e6a-c7f2-4a9b-9992-e7c99c11cbee.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}