
{{- define "go-echoadff867a-105e-402b-8755-9658550c62da.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoadff867a-105e-402b-8755-9658550c62da.fullname" -}}
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


{{- define "go-echoadff867a-105e-402b-8755-9658550c62da.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoadff867a-105e-402b-8755-9658550c62da.labels" -}}
helm.sh/chart: {{ include "go-echoadff867a-105e-402b-8755-9658550c62da.chart" . }}
{{ include "go-echoadff867a-105e-402b-8755-9658550c62da.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoadff867a-105e-402b-8755-9658550c62da.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoadff867a-105e-402b-8755-9658550c62da.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}