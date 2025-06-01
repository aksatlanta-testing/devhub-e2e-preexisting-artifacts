
{{- define "go-echo102f01d1-b5fa-44dc-aae2-314ca3c58854.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo102f01d1-b5fa-44dc-aae2-314ca3c58854.fullname" -}}
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


{{- define "go-echo102f01d1-b5fa-44dc-aae2-314ca3c58854.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo102f01d1-b5fa-44dc-aae2-314ca3c58854.labels" -}}
helm.sh/chart: {{ include "go-echo102f01d1-b5fa-44dc-aae2-314ca3c58854.chart" . }}
{{ include "go-echo102f01d1-b5fa-44dc-aae2-314ca3c58854.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo102f01d1-b5fa-44dc-aae2-314ca3c58854.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo102f01d1-b5fa-44dc-aae2-314ca3c58854.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}