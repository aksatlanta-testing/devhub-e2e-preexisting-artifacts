{{/*
Expand the name of the chart.
*/}}
{{- define "go-echofbca2587-7446-47c7-ba27-7f342da6e5bf.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "go-echofbca2587-7446-47c7-ba27-7f342da6e5bf.fullname" -}}
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
{{- define "go-echofbca2587-7446-47c7-ba27-7f342da6e5bf.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "go-echofbca2587-7446-47c7-ba27-7f342da6e5bf.labels" -}}
helm.sh/chart: {{ include "go-echofbca2587-7446-47c7-ba27-7f342da6e5bf.chart" . }}
{{ include "go-echofbca2587-7446-47c7-ba27-7f342da6e5bf.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "go-echofbca2587-7446-47c7-ba27-7f342da6e5bf.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echofbca2587-7446-47c7-ba27-7f342da6e5bf.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}