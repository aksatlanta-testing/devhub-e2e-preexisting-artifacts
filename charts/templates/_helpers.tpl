{{/*
Expand the name of the chart.
*/}}
{{- define "go-echoaeda1e85-d0fc-4b31-92df-d004f7c1341e.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "go-echoaeda1e85-d0fc-4b31-92df-d004f7c1341e.fullname" -}}
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
{{- define "go-echoaeda1e85-d0fc-4b31-92df-d004f7c1341e.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "go-echoaeda1e85-d0fc-4b31-92df-d004f7c1341e.labels" -}}
helm.sh/chart: {{ include "go-echoaeda1e85-d0fc-4b31-92df-d004f7c1341e.chart" . }}
{{ include "go-echoaeda1e85-d0fc-4b31-92df-d004f7c1341e.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "go-echoaeda1e85-d0fc-4b31-92df-d004f7c1341e.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoaeda1e85-d0fc-4b31-92df-d004f7c1341e.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}