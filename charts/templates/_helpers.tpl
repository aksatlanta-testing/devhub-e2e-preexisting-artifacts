
{{- define "go-echo111f2150-e88b-467d-966a-d074f0a0522e.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo111f2150-e88b-467d-966a-d074f0a0522e.fullname" -}}
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


{{- define "go-echo111f2150-e88b-467d-966a-d074f0a0522e.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo111f2150-e88b-467d-966a-d074f0a0522e.labels" -}}
helm.sh/chart: {{ include "go-echo111f2150-e88b-467d-966a-d074f0a0522e.chart" . }}
{{ include "go-echo111f2150-e88b-467d-966a-d074f0a0522e.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo111f2150-e88b-467d-966a-d074f0a0522e.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo111f2150-e88b-467d-966a-d074f0a0522e.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}