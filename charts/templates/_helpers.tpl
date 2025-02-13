
{{- define "go-echofce4c8b8-e9c0-4ae7-8864-b9ff8b1d1220.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofce4c8b8-e9c0-4ae7-8864-b9ff8b1d1220.fullname" -}}
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


{{- define "go-echofce4c8b8-e9c0-4ae7-8864-b9ff8b1d1220.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofce4c8b8-e9c0-4ae7-8864-b9ff8b1d1220.labels" -}}
helm.sh/chart: {{ include "go-echofce4c8b8-e9c0-4ae7-8864-b9ff8b1d1220.chart" . }}
{{ include "go-echofce4c8b8-e9c0-4ae7-8864-b9ff8b1d1220.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echofce4c8b8-e9c0-4ae7-8864-b9ff8b1d1220.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echofce4c8b8-e9c0-4ae7-8864-b9ff8b1d1220.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}