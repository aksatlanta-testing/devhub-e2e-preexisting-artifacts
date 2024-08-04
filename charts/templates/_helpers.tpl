{{/*
Expand the name of the chart.
*/}}
{{- define "go-echo409c765b-09ba-4b12-a9a2-d5230123da61.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "go-echo409c765b-09ba-4b12-a9a2-d5230123da61.fullname" -}}
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
{{- define "go-echo409c765b-09ba-4b12-a9a2-d5230123da61.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "go-echo409c765b-09ba-4b12-a9a2-d5230123da61.labels" -}}
helm.sh/chart: {{ include "go-echo409c765b-09ba-4b12-a9a2-d5230123da61.chart" . }}
{{ include "go-echo409c765b-09ba-4b12-a9a2-d5230123da61.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "go-echo409c765b-09ba-4b12-a9a2-d5230123da61.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo409c765b-09ba-4b12-a9a2-d5230123da61.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}