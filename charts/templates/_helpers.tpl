
{{- define "go-echo2654e38d-a0bc-4b0a-9a2c-3c0a7db8100e.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo2654e38d-a0bc-4b0a-9a2c-3c0a7db8100e.fullname" -}}
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


{{- define "go-echo2654e38d-a0bc-4b0a-9a2c-3c0a7db8100e.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo2654e38d-a0bc-4b0a-9a2c-3c0a7db8100e.labels" -}}
helm.sh/chart: {{ include "go-echo2654e38d-a0bc-4b0a-9a2c-3c0a7db8100e.chart" . }}
{{ include "go-echo2654e38d-a0bc-4b0a-9a2c-3c0a7db8100e.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo2654e38d-a0bc-4b0a-9a2c-3c0a7db8100e.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo2654e38d-a0bc-4b0a-9a2c-3c0a7db8100e.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}