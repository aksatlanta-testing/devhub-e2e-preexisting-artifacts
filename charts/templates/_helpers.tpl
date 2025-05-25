
{{- define "go-echocc823d3f-3c04-4551-9911-f7de8dd5e136.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocc823d3f-3c04-4551-9911-f7de8dd5e136.fullname" -}}
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


{{- define "go-echocc823d3f-3c04-4551-9911-f7de8dd5e136.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocc823d3f-3c04-4551-9911-f7de8dd5e136.labels" -}}
helm.sh/chart: {{ include "go-echocc823d3f-3c04-4551-9911-f7de8dd5e136.chart" . }}
{{ include "go-echocc823d3f-3c04-4551-9911-f7de8dd5e136.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echocc823d3f-3c04-4551-9911-f7de8dd5e136.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echocc823d3f-3c04-4551-9911-f7de8dd5e136.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}