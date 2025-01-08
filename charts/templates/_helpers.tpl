
{{- define "go-echodba0dfd6-71de-4113-8c8b-e084e5fb846f.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodba0dfd6-71de-4113-8c8b-e084e5fb846f.fullname" -}}
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


{{- define "go-echodba0dfd6-71de-4113-8c8b-e084e5fb846f.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodba0dfd6-71de-4113-8c8b-e084e5fb846f.labels" -}}
helm.sh/chart: {{ include "go-echodba0dfd6-71de-4113-8c8b-e084e5fb846f.chart" . }}
{{ include "go-echodba0dfd6-71de-4113-8c8b-e084e5fb846f.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echodba0dfd6-71de-4113-8c8b-e084e5fb846f.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echodba0dfd6-71de-4113-8c8b-e084e5fb846f.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}