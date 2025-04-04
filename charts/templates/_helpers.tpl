
{{- define "go-echof935894d-5539-4f10-9cd9-e0a2f06de1eb.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof935894d-5539-4f10-9cd9-e0a2f06de1eb.fullname" -}}
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


{{- define "go-echof935894d-5539-4f10-9cd9-e0a2f06de1eb.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof935894d-5539-4f10-9cd9-e0a2f06de1eb.labels" -}}
helm.sh/chart: {{ include "go-echof935894d-5539-4f10-9cd9-e0a2f06de1eb.chart" . }}
{{ include "go-echof935894d-5539-4f10-9cd9-e0a2f06de1eb.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof935894d-5539-4f10-9cd9-e0a2f06de1eb.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof935894d-5539-4f10-9cd9-e0a2f06de1eb.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}