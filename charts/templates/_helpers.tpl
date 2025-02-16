
{{- define "go-echo51f31f03-9afb-4c99-8190-80c4b6aec1e2.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo51f31f03-9afb-4c99-8190-80c4b6aec1e2.fullname" -}}
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


{{- define "go-echo51f31f03-9afb-4c99-8190-80c4b6aec1e2.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo51f31f03-9afb-4c99-8190-80c4b6aec1e2.labels" -}}
helm.sh/chart: {{ include "go-echo51f31f03-9afb-4c99-8190-80c4b6aec1e2.chart" . }}
{{ include "go-echo51f31f03-9afb-4c99-8190-80c4b6aec1e2.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo51f31f03-9afb-4c99-8190-80c4b6aec1e2.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo51f31f03-9afb-4c99-8190-80c4b6aec1e2.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}