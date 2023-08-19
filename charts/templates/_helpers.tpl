{{/*
Expand the name of the chart.
*/}}
{{- define "go-echoff13bb28-d118-4f8b-9b17-e3d18c3da387.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "go-echoff13bb28-d118-4f8b-9b17-e3d18c3da387.fullname" -}}
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
{{- define "go-echoff13bb28-d118-4f8b-9b17-e3d18c3da387.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "go-echoff13bb28-d118-4f8b-9b17-e3d18c3da387.labels" -}}
helm.sh/chart: {{ include "go-echoff13bb28-d118-4f8b-9b17-e3d18c3da387.chart" . }}
{{ include "go-echoff13bb28-d118-4f8b-9b17-e3d18c3da387.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "go-echoff13bb28-d118-4f8b-9b17-e3d18c3da387.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoff13bb28-d118-4f8b-9b17-e3d18c3da387.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}