
{{- define "go-echo0d30dfbc-b932-4471-8bc1-d56d0412b5eb.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo0d30dfbc-b932-4471-8bc1-d56d0412b5eb.fullname" -}}
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


{{- define "go-echo0d30dfbc-b932-4471-8bc1-d56d0412b5eb.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo0d30dfbc-b932-4471-8bc1-d56d0412b5eb.labels" -}}
helm.sh/chart: {{ include "go-echo0d30dfbc-b932-4471-8bc1-d56d0412b5eb.chart" . }}
{{ include "go-echo0d30dfbc-b932-4471-8bc1-d56d0412b5eb.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo0d30dfbc-b932-4471-8bc1-d56d0412b5eb.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo0d30dfbc-b932-4471-8bc1-d56d0412b5eb.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}