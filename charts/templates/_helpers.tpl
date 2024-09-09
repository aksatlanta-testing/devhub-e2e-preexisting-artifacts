{{/*
Expand the name of the chart.
*/}}
{{- define "go-echoecdba49d-eac4-41dc-b27a-32723fda55cb.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "go-echoecdba49d-eac4-41dc-b27a-32723fda55cb.fullname" -}}
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
{{- define "go-echoecdba49d-eac4-41dc-b27a-32723fda55cb.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "go-echoecdba49d-eac4-41dc-b27a-32723fda55cb.labels" -}}
helm.sh/chart: {{ include "go-echoecdba49d-eac4-41dc-b27a-32723fda55cb.chart" . }}
{{ include "go-echoecdba49d-eac4-41dc-b27a-32723fda55cb.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "go-echoecdba49d-eac4-41dc-b27a-32723fda55cb.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoecdba49d-eac4-41dc-b27a-32723fda55cb.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}