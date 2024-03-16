{{/*
Expand the name of the chart.
*/}}
{{- define "go-echofbed3aff-7a0e-4ff1-915e-cb87e7ad50ac.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "go-echofbed3aff-7a0e-4ff1-915e-cb87e7ad50ac.fullname" -}}
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
{{- define "go-echofbed3aff-7a0e-4ff1-915e-cb87e7ad50ac.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "go-echofbed3aff-7a0e-4ff1-915e-cb87e7ad50ac.labels" -}}
helm.sh/chart: {{ include "go-echofbed3aff-7a0e-4ff1-915e-cb87e7ad50ac.chart" . }}
{{ include "go-echofbed3aff-7a0e-4ff1-915e-cb87e7ad50ac.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "go-echofbed3aff-7a0e-4ff1-915e-cb87e7ad50ac.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echofbed3aff-7a0e-4ff1-915e-cb87e7ad50ac.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}