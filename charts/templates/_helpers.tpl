{{/*
Expand the name of the chart.
*/}}
{{- define "go-echoc021938d-1d09-43a2-a198-2d404d85aaac.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "go-echoc021938d-1d09-43a2-a198-2d404d85aaac.fullname" -}}
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
{{- define "go-echoc021938d-1d09-43a2-a198-2d404d85aaac.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "go-echoc021938d-1d09-43a2-a198-2d404d85aaac.labels" -}}
helm.sh/chart: {{ include "go-echoc021938d-1d09-43a2-a198-2d404d85aaac.chart" . }}
{{ include "go-echoc021938d-1d09-43a2-a198-2d404d85aaac.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "go-echoc021938d-1d09-43a2-a198-2d404d85aaac.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoc021938d-1d09-43a2-a198-2d404d85aaac.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}