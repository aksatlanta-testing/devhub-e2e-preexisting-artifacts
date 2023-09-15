{{/*
Expand the name of the chart.
*/}}
{{- define "go-echofd27317e-c676-4af0-880f-0b1051552d7b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "go-echofd27317e-c676-4af0-880f-0b1051552d7b.fullname" -}}
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
{{- define "go-echofd27317e-c676-4af0-880f-0b1051552d7b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "go-echofd27317e-c676-4af0-880f-0b1051552d7b.labels" -}}
helm.sh/chart: {{ include "go-echofd27317e-c676-4af0-880f-0b1051552d7b.chart" . }}
{{ include "go-echofd27317e-c676-4af0-880f-0b1051552d7b.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "go-echofd27317e-c676-4af0-880f-0b1051552d7b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echofd27317e-c676-4af0-880f-0b1051552d7b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}