{{/*
Expand the name of the chart.
*/}}
{{- define "go-echofa396be6-04fb-4c2b-9fde-cc24127d97ad.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "go-echofa396be6-04fb-4c2b-9fde-cc24127d97ad.fullname" -}}
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
{{- define "go-echofa396be6-04fb-4c2b-9fde-cc24127d97ad.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "go-echofa396be6-04fb-4c2b-9fde-cc24127d97ad.labels" -}}
helm.sh/chart: {{ include "go-echofa396be6-04fb-4c2b-9fde-cc24127d97ad.chart" . }}
{{ include "go-echofa396be6-04fb-4c2b-9fde-cc24127d97ad.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "go-echofa396be6-04fb-4c2b-9fde-cc24127d97ad.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echofa396be6-04fb-4c2b-9fde-cc24127d97ad.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}