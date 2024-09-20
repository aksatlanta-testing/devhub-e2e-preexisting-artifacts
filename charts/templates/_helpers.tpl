{{/*
Expand the name of the chart.
*/}}
{{- define "go-echofbda49e7-d4d6-4066-8907-603d9f818768.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "go-echofbda49e7-d4d6-4066-8907-603d9f818768.fullname" -}}
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
{{- define "go-echofbda49e7-d4d6-4066-8907-603d9f818768.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "go-echofbda49e7-d4d6-4066-8907-603d9f818768.labels" -}}
helm.sh/chart: {{ include "go-echofbda49e7-d4d6-4066-8907-603d9f818768.chart" . }}
{{ include "go-echofbda49e7-d4d6-4066-8907-603d9f818768.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "go-echofbda49e7-d4d6-4066-8907-603d9f818768.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echofbda49e7-d4d6-4066-8907-603d9f818768.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}