
{{- define "go-echof812fa85-93b8-4d7e-ab0d-fdb41b9cfcf1.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof812fa85-93b8-4d7e-ab0d-fdb41b9cfcf1.fullname" -}}
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


{{- define "go-echof812fa85-93b8-4d7e-ab0d-fdb41b9cfcf1.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof812fa85-93b8-4d7e-ab0d-fdb41b9cfcf1.labels" -}}
helm.sh/chart: {{ include "go-echof812fa85-93b8-4d7e-ab0d-fdb41b9cfcf1.chart" . }}
{{ include "go-echof812fa85-93b8-4d7e-ab0d-fdb41b9cfcf1.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof812fa85-93b8-4d7e-ab0d-fdb41b9cfcf1.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof812fa85-93b8-4d7e-ab0d-fdb41b9cfcf1.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}