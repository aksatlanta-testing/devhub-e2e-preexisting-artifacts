
{{- define "go-echoda382d8f-4a0b-4c06-a8d4-9145ae6d7979.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoda382d8f-4a0b-4c06-a8d4-9145ae6d7979.fullname" -}}
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


{{- define "go-echoda382d8f-4a0b-4c06-a8d4-9145ae6d7979.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoda382d8f-4a0b-4c06-a8d4-9145ae6d7979.labels" -}}
helm.sh/chart: {{ include "go-echoda382d8f-4a0b-4c06-a8d4-9145ae6d7979.chart" . }}
{{ include "go-echoda382d8f-4a0b-4c06-a8d4-9145ae6d7979.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoda382d8f-4a0b-4c06-a8d4-9145ae6d7979.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoda382d8f-4a0b-4c06-a8d4-9145ae6d7979.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}