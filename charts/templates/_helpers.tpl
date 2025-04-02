
{{- define "go-echodbe3e0c5-c0a0-44ed-b9ec-f3980c387196.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodbe3e0c5-c0a0-44ed-b9ec-f3980c387196.fullname" -}}
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


{{- define "go-echodbe3e0c5-c0a0-44ed-b9ec-f3980c387196.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodbe3e0c5-c0a0-44ed-b9ec-f3980c387196.labels" -}}
helm.sh/chart: {{ include "go-echodbe3e0c5-c0a0-44ed-b9ec-f3980c387196.chart" . }}
{{ include "go-echodbe3e0c5-c0a0-44ed-b9ec-f3980c387196.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echodbe3e0c5-c0a0-44ed-b9ec-f3980c387196.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echodbe3e0c5-c0a0-44ed-b9ec-f3980c387196.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}