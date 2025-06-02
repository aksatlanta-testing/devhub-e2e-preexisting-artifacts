
{{- define "go-echoede2e406-3251-47fb-ba59-53d2df91131e.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoede2e406-3251-47fb-ba59-53d2df91131e.fullname" -}}
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


{{- define "go-echoede2e406-3251-47fb-ba59-53d2df91131e.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoede2e406-3251-47fb-ba59-53d2df91131e.labels" -}}
helm.sh/chart: {{ include "go-echoede2e406-3251-47fb-ba59-53d2df91131e.chart" . }}
{{ include "go-echoede2e406-3251-47fb-ba59-53d2df91131e.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoede2e406-3251-47fb-ba59-53d2df91131e.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoede2e406-3251-47fb-ba59-53d2df91131e.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}