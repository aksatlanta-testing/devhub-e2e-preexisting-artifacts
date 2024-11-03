
{{- define "go-echof2e44d1b-8f95-41b3-8d11-0e6ecd28b67b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof2e44d1b-8f95-41b3-8d11-0e6ecd28b67b.fullname" -}}
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


{{- define "go-echof2e44d1b-8f95-41b3-8d11-0e6ecd28b67b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof2e44d1b-8f95-41b3-8d11-0e6ecd28b67b.labels" -}}
helm.sh/chart: {{ include "go-echof2e44d1b-8f95-41b3-8d11-0e6ecd28b67b.chart" . }}
{{ include "go-echof2e44d1b-8f95-41b3-8d11-0e6ecd28b67b.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof2e44d1b-8f95-41b3-8d11-0e6ecd28b67b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof2e44d1b-8f95-41b3-8d11-0e6ecd28b67b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}