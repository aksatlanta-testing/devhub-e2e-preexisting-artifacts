
{{- define "go-echoec968257-56c7-48f9-be4f-9af7b5a7d37e.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoec968257-56c7-48f9-be4f-9af7b5a7d37e.fullname" -}}
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


{{- define "go-echoec968257-56c7-48f9-be4f-9af7b5a7d37e.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoec968257-56c7-48f9-be4f-9af7b5a7d37e.labels" -}}
helm.sh/chart: {{ include "go-echoec968257-56c7-48f9-be4f-9af7b5a7d37e.chart" . }}
{{ include "go-echoec968257-56c7-48f9-be4f-9af7b5a7d37e.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoec968257-56c7-48f9-be4f-9af7b5a7d37e.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoec968257-56c7-48f9-be4f-9af7b5a7d37e.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}