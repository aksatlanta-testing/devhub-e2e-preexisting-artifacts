{{/*
Expand the name of the chart.
*/}}
{{- define "go-echo08c7852d-941a-4fc2-81ff-f24563a364bf.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "go-echo08c7852d-941a-4fc2-81ff-f24563a364bf.fullname" -}}
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
{{- define "go-echo08c7852d-941a-4fc2-81ff-f24563a364bf.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "go-echo08c7852d-941a-4fc2-81ff-f24563a364bf.labels" -}}
helm.sh/chart: {{ include "go-echo08c7852d-941a-4fc2-81ff-f24563a364bf.chart" . }}
{{ include "go-echo08c7852d-941a-4fc2-81ff-f24563a364bf.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "go-echo08c7852d-941a-4fc2-81ff-f24563a364bf.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo08c7852d-941a-4fc2-81ff-f24563a364bf.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}