
{{- define "go-echoaf1b62f1-e4b9-4afe-91d4-eb1d9c6b9684.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoaf1b62f1-e4b9-4afe-91d4-eb1d9c6b9684.fullname" -}}
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


{{- define "go-echoaf1b62f1-e4b9-4afe-91d4-eb1d9c6b9684.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoaf1b62f1-e4b9-4afe-91d4-eb1d9c6b9684.labels" -}}
helm.sh/chart: {{ include "go-echoaf1b62f1-e4b9-4afe-91d4-eb1d9c6b9684.chart" . }}
{{ include "go-echoaf1b62f1-e4b9-4afe-91d4-eb1d9c6b9684.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoaf1b62f1-e4b9-4afe-91d4-eb1d9c6b9684.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoaf1b62f1-e4b9-4afe-91d4-eb1d9c6b9684.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}