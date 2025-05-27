
{{- define "go-echob19e6fa5-25c8-41dd-8b36-d5c336ec4427.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob19e6fa5-25c8-41dd-8b36-d5c336ec4427.fullname" -}}
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


{{- define "go-echob19e6fa5-25c8-41dd-8b36-d5c336ec4427.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob19e6fa5-25c8-41dd-8b36-d5c336ec4427.labels" -}}
helm.sh/chart: {{ include "go-echob19e6fa5-25c8-41dd-8b36-d5c336ec4427.chart" . }}
{{ include "go-echob19e6fa5-25c8-41dd-8b36-d5c336ec4427.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echob19e6fa5-25c8-41dd-8b36-d5c336ec4427.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echob19e6fa5-25c8-41dd-8b36-d5c336ec4427.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}