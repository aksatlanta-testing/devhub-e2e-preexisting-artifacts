
{{- define "go-echode784c32-cd4d-4ed8-8d41-4123daed92fe.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echode784c32-cd4d-4ed8-8d41-4123daed92fe.fullname" -}}
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


{{- define "go-echode784c32-cd4d-4ed8-8d41-4123daed92fe.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echode784c32-cd4d-4ed8-8d41-4123daed92fe.labels" -}}
helm.sh/chart: {{ include "go-echode784c32-cd4d-4ed8-8d41-4123daed92fe.chart" . }}
{{ include "go-echode784c32-cd4d-4ed8-8d41-4123daed92fe.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echode784c32-cd4d-4ed8-8d41-4123daed92fe.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echode784c32-cd4d-4ed8-8d41-4123daed92fe.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}