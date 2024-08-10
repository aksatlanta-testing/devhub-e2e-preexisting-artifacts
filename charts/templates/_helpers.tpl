{{/*
Expand the name of the chart.
*/}}
{{- define "go-echoeda66b7f-83f9-49ed-8ff0-a3282c630369.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "go-echoeda66b7f-83f9-49ed-8ff0-a3282c630369.fullname" -}}
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
{{- define "go-echoeda66b7f-83f9-49ed-8ff0-a3282c630369.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "go-echoeda66b7f-83f9-49ed-8ff0-a3282c630369.labels" -}}
helm.sh/chart: {{ include "go-echoeda66b7f-83f9-49ed-8ff0-a3282c630369.chart" . }}
{{ include "go-echoeda66b7f-83f9-49ed-8ff0-a3282c630369.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "go-echoeda66b7f-83f9-49ed-8ff0-a3282c630369.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoeda66b7f-83f9-49ed-8ff0-a3282c630369.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}