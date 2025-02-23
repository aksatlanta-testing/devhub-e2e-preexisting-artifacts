
{{- define "go-echo5eec4b56-d347-4918-b9c5-2f518163c708.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo5eec4b56-d347-4918-b9c5-2f518163c708.fullname" -}}
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


{{- define "go-echo5eec4b56-d347-4918-b9c5-2f518163c708.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo5eec4b56-d347-4918-b9c5-2f518163c708.labels" -}}
helm.sh/chart: {{ include "go-echo5eec4b56-d347-4918-b9c5-2f518163c708.chart" . }}
{{ include "go-echo5eec4b56-d347-4918-b9c5-2f518163c708.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo5eec4b56-d347-4918-b9c5-2f518163c708.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo5eec4b56-d347-4918-b9c5-2f518163c708.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}