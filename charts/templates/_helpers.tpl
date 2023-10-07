{{/*
Expand the name of the chart.
*/}}
{{- define "go-echo3eab5922-090c-424d-be73-020fa9184824.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "go-echo3eab5922-090c-424d-be73-020fa9184824.fullname" -}}
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
{{- define "go-echo3eab5922-090c-424d-be73-020fa9184824.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "go-echo3eab5922-090c-424d-be73-020fa9184824.labels" -}}
helm.sh/chart: {{ include "go-echo3eab5922-090c-424d-be73-020fa9184824.chart" . }}
{{ include "go-echo3eab5922-090c-424d-be73-020fa9184824.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "go-echo3eab5922-090c-424d-be73-020fa9184824.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo3eab5922-090c-424d-be73-020fa9184824.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}