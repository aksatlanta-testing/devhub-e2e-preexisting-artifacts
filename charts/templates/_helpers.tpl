
{{- define "go-echoafb89047-6e75-4164-a571-7f30a8be882e.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoafb89047-6e75-4164-a571-7f30a8be882e.fullname" -}}
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


{{- define "go-echoafb89047-6e75-4164-a571-7f30a8be882e.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoafb89047-6e75-4164-a571-7f30a8be882e.labels" -}}
helm.sh/chart: {{ include "go-echoafb89047-6e75-4164-a571-7f30a8be882e.chart" . }}
{{ include "go-echoafb89047-6e75-4164-a571-7f30a8be882e.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoafb89047-6e75-4164-a571-7f30a8be882e.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoafb89047-6e75-4164-a571-7f30a8be882e.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}