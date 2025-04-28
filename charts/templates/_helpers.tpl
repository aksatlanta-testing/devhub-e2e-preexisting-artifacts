
{{- define "go-echo8b8d8050-1da0-4bf6-ac85-ce5538834a23.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo8b8d8050-1da0-4bf6-ac85-ce5538834a23.fullname" -}}
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


{{- define "go-echo8b8d8050-1da0-4bf6-ac85-ce5538834a23.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo8b8d8050-1da0-4bf6-ac85-ce5538834a23.labels" -}}
helm.sh/chart: {{ include "go-echo8b8d8050-1da0-4bf6-ac85-ce5538834a23.chart" . }}
{{ include "go-echo8b8d8050-1da0-4bf6-ac85-ce5538834a23.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo8b8d8050-1da0-4bf6-ac85-ce5538834a23.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo8b8d8050-1da0-4bf6-ac85-ce5538834a23.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}