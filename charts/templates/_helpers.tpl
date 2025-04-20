
{{- define "go-echof6936288-2e1a-4091-8d41-e13bc6afa65b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof6936288-2e1a-4091-8d41-e13bc6afa65b.fullname" -}}
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


{{- define "go-echof6936288-2e1a-4091-8d41-e13bc6afa65b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof6936288-2e1a-4091-8d41-e13bc6afa65b.labels" -}}
helm.sh/chart: {{ include "go-echof6936288-2e1a-4091-8d41-e13bc6afa65b.chart" . }}
{{ include "go-echof6936288-2e1a-4091-8d41-e13bc6afa65b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof6936288-2e1a-4091-8d41-e13bc6afa65b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof6936288-2e1a-4091-8d41-e13bc6afa65b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}