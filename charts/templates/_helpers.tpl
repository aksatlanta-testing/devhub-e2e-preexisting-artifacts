{{/*
Expand the name of the chart.
*/}}
{{- define "go-echo267f68b3-6f31-4e21-9587-7559d4bd5bcd.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "go-echo267f68b3-6f31-4e21-9587-7559d4bd5bcd.fullname" -}}
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
{{- define "go-echo267f68b3-6f31-4e21-9587-7559d4bd5bcd.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "go-echo267f68b3-6f31-4e21-9587-7559d4bd5bcd.labels" -}}
helm.sh/chart: {{ include "go-echo267f68b3-6f31-4e21-9587-7559d4bd5bcd.chart" . }}
{{ include "go-echo267f68b3-6f31-4e21-9587-7559d4bd5bcd.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "go-echo267f68b3-6f31-4e21-9587-7559d4bd5bcd.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo267f68b3-6f31-4e21-9587-7559d4bd5bcd.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}