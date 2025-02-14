
{{- define "go-echo9adc62d6-874d-48b1-a00a-f3b59c7c82ec.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo9adc62d6-874d-48b1-a00a-f3b59c7c82ec.fullname" -}}
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


{{- define "go-echo9adc62d6-874d-48b1-a00a-f3b59c7c82ec.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo9adc62d6-874d-48b1-a00a-f3b59c7c82ec.labels" -}}
helm.sh/chart: {{ include "go-echo9adc62d6-874d-48b1-a00a-f3b59c7c82ec.chart" . }}
{{ include "go-echo9adc62d6-874d-48b1-a00a-f3b59c7c82ec.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo9adc62d6-874d-48b1-a00a-f3b59c7c82ec.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo9adc62d6-874d-48b1-a00a-f3b59c7c82ec.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}