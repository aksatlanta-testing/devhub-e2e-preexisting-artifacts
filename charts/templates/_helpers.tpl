
{{- define "go-echo1c02eca5-6042-4e8b-890c-1ff92805896e.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo1c02eca5-6042-4e8b-890c-1ff92805896e.fullname" -}}
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


{{- define "go-echo1c02eca5-6042-4e8b-890c-1ff92805896e.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo1c02eca5-6042-4e8b-890c-1ff92805896e.labels" -}}
helm.sh/chart: {{ include "go-echo1c02eca5-6042-4e8b-890c-1ff92805896e.chart" . }}
{{ include "go-echo1c02eca5-6042-4e8b-890c-1ff92805896e.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo1c02eca5-6042-4e8b-890c-1ff92805896e.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo1c02eca5-6042-4e8b-890c-1ff92805896e.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}