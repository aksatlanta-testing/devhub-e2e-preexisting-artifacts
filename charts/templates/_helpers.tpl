
{{- define "go-echobf6e0ffd-d1b0-455a-833b-d8974029161e.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobf6e0ffd-d1b0-455a-833b-d8974029161e.fullname" -}}
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


{{- define "go-echobf6e0ffd-d1b0-455a-833b-d8974029161e.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobf6e0ffd-d1b0-455a-833b-d8974029161e.labels" -}}
helm.sh/chart: {{ include "go-echobf6e0ffd-d1b0-455a-833b-d8974029161e.chart" . }}
{{ include "go-echobf6e0ffd-d1b0-455a-833b-d8974029161e.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echobf6e0ffd-d1b0-455a-833b-d8974029161e.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echobf6e0ffd-d1b0-455a-833b-d8974029161e.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}