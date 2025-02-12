
{{- define "go-echo1a30e0c0-d289-4872-b60f-8ab522b7c319.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo1a30e0c0-d289-4872-b60f-8ab522b7c319.fullname" -}}
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


{{- define "go-echo1a30e0c0-d289-4872-b60f-8ab522b7c319.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo1a30e0c0-d289-4872-b60f-8ab522b7c319.labels" -}}
helm.sh/chart: {{ include "go-echo1a30e0c0-d289-4872-b60f-8ab522b7c319.chart" . }}
{{ include "go-echo1a30e0c0-d289-4872-b60f-8ab522b7c319.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo1a30e0c0-d289-4872-b60f-8ab522b7c319.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo1a30e0c0-d289-4872-b60f-8ab522b7c319.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}