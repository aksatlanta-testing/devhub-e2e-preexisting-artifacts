
{{- define "go-echocbd43bf3-d3bc-4ad1-83fe-97b71beb2c5f.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocbd43bf3-d3bc-4ad1-83fe-97b71beb2c5f.fullname" -}}
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


{{- define "go-echocbd43bf3-d3bc-4ad1-83fe-97b71beb2c5f.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocbd43bf3-d3bc-4ad1-83fe-97b71beb2c5f.labels" -}}
helm.sh/chart: {{ include "go-echocbd43bf3-d3bc-4ad1-83fe-97b71beb2c5f.chart" . }}
{{ include "go-echocbd43bf3-d3bc-4ad1-83fe-97b71beb2c5f.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echocbd43bf3-d3bc-4ad1-83fe-97b71beb2c5f.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echocbd43bf3-d3bc-4ad1-83fe-97b71beb2c5f.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}