
{{- define "go-echo06deced6-6fff-402e-8799-01643cac0285.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo06deced6-6fff-402e-8799-01643cac0285.fullname" -}}
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


{{- define "go-echo06deced6-6fff-402e-8799-01643cac0285.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo06deced6-6fff-402e-8799-01643cac0285.labels" -}}
helm.sh/chart: {{ include "go-echo06deced6-6fff-402e-8799-01643cac0285.chart" . }}
{{ include "go-echo06deced6-6fff-402e-8799-01643cac0285.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo06deced6-6fff-402e-8799-01643cac0285.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo06deced6-6fff-402e-8799-01643cac0285.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}