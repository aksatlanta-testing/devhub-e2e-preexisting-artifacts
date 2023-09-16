{{/*
Expand the name of the chart.
*/}}
{{- define "go-echobe7ad4e5-3455-4573-a000-157bdf30c9aa.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "go-echobe7ad4e5-3455-4573-a000-157bdf30c9aa.fullname" -}}
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
{{- define "go-echobe7ad4e5-3455-4573-a000-157bdf30c9aa.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "go-echobe7ad4e5-3455-4573-a000-157bdf30c9aa.labels" -}}
helm.sh/chart: {{ include "go-echobe7ad4e5-3455-4573-a000-157bdf30c9aa.chart" . }}
{{ include "go-echobe7ad4e5-3455-4573-a000-157bdf30c9aa.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "go-echobe7ad4e5-3455-4573-a000-157bdf30c9aa.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echobe7ad4e5-3455-4573-a000-157bdf30c9aa.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}