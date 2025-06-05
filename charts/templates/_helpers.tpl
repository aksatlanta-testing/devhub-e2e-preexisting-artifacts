
{{- define "go-echoc05be388-2530-4e78-9152-4d05a76e1a2e.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc05be388-2530-4e78-9152-4d05a76e1a2e.fullname" -}}
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


{{- define "go-echoc05be388-2530-4e78-9152-4d05a76e1a2e.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc05be388-2530-4e78-9152-4d05a76e1a2e.labels" -}}
helm.sh/chart: {{ include "go-echoc05be388-2530-4e78-9152-4d05a76e1a2e.chart" . }}
{{ include "go-echoc05be388-2530-4e78-9152-4d05a76e1a2e.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoc05be388-2530-4e78-9152-4d05a76e1a2e.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoc05be388-2530-4e78-9152-4d05a76e1a2e.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}