
{{- define "go-echo2c9c2897-7102-46d1-b923-7e4c611f1dac.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo2c9c2897-7102-46d1-b923-7e4c611f1dac.fullname" -}}
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


{{- define "go-echo2c9c2897-7102-46d1-b923-7e4c611f1dac.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo2c9c2897-7102-46d1-b923-7e4c611f1dac.labels" -}}
helm.sh/chart: {{ include "go-echo2c9c2897-7102-46d1-b923-7e4c611f1dac.chart" . }}
{{ include "go-echo2c9c2897-7102-46d1-b923-7e4c611f1dac.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo2c9c2897-7102-46d1-b923-7e4c611f1dac.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo2c9c2897-7102-46d1-b923-7e4c611f1dac.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}