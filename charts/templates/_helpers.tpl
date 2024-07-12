{{/*
Expand the name of the chart.
*/}}
{{- define "go-echo41a2cdad-51a8-4aa0-9297-32e6cf300511.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "go-echo41a2cdad-51a8-4aa0-9297-32e6cf300511.fullname" -}}
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
{{- define "go-echo41a2cdad-51a8-4aa0-9297-32e6cf300511.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "go-echo41a2cdad-51a8-4aa0-9297-32e6cf300511.labels" -}}
helm.sh/chart: {{ include "go-echo41a2cdad-51a8-4aa0-9297-32e6cf300511.chart" . }}
{{ include "go-echo41a2cdad-51a8-4aa0-9297-32e6cf300511.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "go-echo41a2cdad-51a8-4aa0-9297-32e6cf300511.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo41a2cdad-51a8-4aa0-9297-32e6cf300511.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}