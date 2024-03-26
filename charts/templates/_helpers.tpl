{{/*
Expand the name of the chart.
*/}}
{{- define "go-echo870f92e1-63e9-4ac1-a23a-948228dd45cd.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "go-echo870f92e1-63e9-4ac1-a23a-948228dd45cd.fullname" -}}
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
{{- define "go-echo870f92e1-63e9-4ac1-a23a-948228dd45cd.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "go-echo870f92e1-63e9-4ac1-a23a-948228dd45cd.labels" -}}
helm.sh/chart: {{ include "go-echo870f92e1-63e9-4ac1-a23a-948228dd45cd.chart" . }}
{{ include "go-echo870f92e1-63e9-4ac1-a23a-948228dd45cd.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "go-echo870f92e1-63e9-4ac1-a23a-948228dd45cd.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo870f92e1-63e9-4ac1-a23a-948228dd45cd.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}