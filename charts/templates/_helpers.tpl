{{/*
Expand the name of the chart.
*/}}
{{- define "go-echob1995eee-0262-43d5-b6e3-a3986814e7ad.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "go-echob1995eee-0262-43d5-b6e3-a3986814e7ad.fullname" -}}
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
{{- define "go-echob1995eee-0262-43d5-b6e3-a3986814e7ad.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "go-echob1995eee-0262-43d5-b6e3-a3986814e7ad.labels" -}}
helm.sh/chart: {{ include "go-echob1995eee-0262-43d5-b6e3-a3986814e7ad.chart" . }}
{{ include "go-echob1995eee-0262-43d5-b6e3-a3986814e7ad.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "go-echob1995eee-0262-43d5-b6e3-a3986814e7ad.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echob1995eee-0262-43d5-b6e3-a3986814e7ad.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}