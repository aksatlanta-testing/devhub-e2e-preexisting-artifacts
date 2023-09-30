{{/*
Expand the name of the chart.
*/}}
{{- define "go-echo2c1ba9f9-d9c5-4495-b6c8-6a1b6ff21bfc.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "go-echo2c1ba9f9-d9c5-4495-b6c8-6a1b6ff21bfc.fullname" -}}
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
{{- define "go-echo2c1ba9f9-d9c5-4495-b6c8-6a1b6ff21bfc.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "go-echo2c1ba9f9-d9c5-4495-b6c8-6a1b6ff21bfc.labels" -}}
helm.sh/chart: {{ include "go-echo2c1ba9f9-d9c5-4495-b6c8-6a1b6ff21bfc.chart" . }}
{{ include "go-echo2c1ba9f9-d9c5-4495-b6c8-6a1b6ff21bfc.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "go-echo2c1ba9f9-d9c5-4495-b6c8-6a1b6ff21bfc.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo2c1ba9f9-d9c5-4495-b6c8-6a1b6ff21bfc.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}