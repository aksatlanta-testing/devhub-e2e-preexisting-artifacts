{{/*
Expand the name of the chart.
*/}}
{{- define "go-echod199bb1d-29cd-49f0-b1ef-838f22d21b15.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "go-echod199bb1d-29cd-49f0-b1ef-838f22d21b15.fullname" -}}
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
{{- define "go-echod199bb1d-29cd-49f0-b1ef-838f22d21b15.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "go-echod199bb1d-29cd-49f0-b1ef-838f22d21b15.labels" -}}
helm.sh/chart: {{ include "go-echod199bb1d-29cd-49f0-b1ef-838f22d21b15.chart" . }}
{{ include "go-echod199bb1d-29cd-49f0-b1ef-838f22d21b15.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "go-echod199bb1d-29cd-49f0-b1ef-838f22d21b15.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod199bb1d-29cd-49f0-b1ef-838f22d21b15.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}