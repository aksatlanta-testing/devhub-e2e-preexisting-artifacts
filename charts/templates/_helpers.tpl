
{{- define "go-echof218f553-bd74-4a88-ba10-ba2769d52fef.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof218f553-bd74-4a88-ba10-ba2769d52fef.fullname" -}}
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


{{- define "go-echof218f553-bd74-4a88-ba10-ba2769d52fef.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof218f553-bd74-4a88-ba10-ba2769d52fef.labels" -}}
helm.sh/chart: {{ include "go-echof218f553-bd74-4a88-ba10-ba2769d52fef.chart" . }}
{{ include "go-echof218f553-bd74-4a88-ba10-ba2769d52fef.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof218f553-bd74-4a88-ba10-ba2769d52fef.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof218f553-bd74-4a88-ba10-ba2769d52fef.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}