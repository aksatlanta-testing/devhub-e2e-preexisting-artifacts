{{/*
Expand the name of the chart.
*/}}
{{- define "go-echo2a12e4a0-95b5-40b5-9c7e-b765c67e0940.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "go-echo2a12e4a0-95b5-40b5-9c7e-b765c67e0940.fullname" -}}
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
{{- define "go-echo2a12e4a0-95b5-40b5-9c7e-b765c67e0940.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "go-echo2a12e4a0-95b5-40b5-9c7e-b765c67e0940.labels" -}}
helm.sh/chart: {{ include "go-echo2a12e4a0-95b5-40b5-9c7e-b765c67e0940.chart" . }}
{{ include "go-echo2a12e4a0-95b5-40b5-9c7e-b765c67e0940.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "go-echo2a12e4a0-95b5-40b5-9c7e-b765c67e0940.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo2a12e4a0-95b5-40b5-9c7e-b765c67e0940.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}