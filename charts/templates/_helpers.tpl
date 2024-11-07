
{{- define "go-echob16d2c4b-ad72-4717-9312-3f2934cade71.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob16d2c4b-ad72-4717-9312-3f2934cade71.fullname" -}}
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


{{- define "go-echob16d2c4b-ad72-4717-9312-3f2934cade71.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob16d2c4b-ad72-4717-9312-3f2934cade71.labels" -}}
helm.sh/chart: {{ include "go-echob16d2c4b-ad72-4717-9312-3f2934cade71.chart" . }}
{{ include "go-echob16d2c4b-ad72-4717-9312-3f2934cade71.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echob16d2c4b-ad72-4717-9312-3f2934cade71.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echob16d2c4b-ad72-4717-9312-3f2934cade71.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}