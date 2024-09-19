{{/*
Expand the name of the chart.
*/}}
{{- define "go-echob64d6721-1c31-48fd-b529-4b3afc2622ac.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "go-echob64d6721-1c31-48fd-b529-4b3afc2622ac.fullname" -}}
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
{{- define "go-echob64d6721-1c31-48fd-b529-4b3afc2622ac.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "go-echob64d6721-1c31-48fd-b529-4b3afc2622ac.labels" -}}
helm.sh/chart: {{ include "go-echob64d6721-1c31-48fd-b529-4b3afc2622ac.chart" . }}
{{ include "go-echob64d6721-1c31-48fd-b529-4b3afc2622ac.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "go-echob64d6721-1c31-48fd-b529-4b3afc2622ac.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echob64d6721-1c31-48fd-b529-4b3afc2622ac.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}