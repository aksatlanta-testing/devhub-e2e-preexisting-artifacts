
{{- define "go-echo70d68e11-479a-4dd5-8116-5136eeea1500.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo70d68e11-479a-4dd5-8116-5136eeea1500.fullname" -}}
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


{{- define "go-echo70d68e11-479a-4dd5-8116-5136eeea1500.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo70d68e11-479a-4dd5-8116-5136eeea1500.labels" -}}
helm.sh/chart: {{ include "go-echo70d68e11-479a-4dd5-8116-5136eeea1500.chart" . }}
{{ include "go-echo70d68e11-479a-4dd5-8116-5136eeea1500.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo70d68e11-479a-4dd5-8116-5136eeea1500.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo70d68e11-479a-4dd5-8116-5136eeea1500.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}