
{{- define "go-echod9aa50ff-5a41-42b0-a10e-26ba1cbcd974.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod9aa50ff-5a41-42b0-a10e-26ba1cbcd974.fullname" -}}
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


{{- define "go-echod9aa50ff-5a41-42b0-a10e-26ba1cbcd974.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod9aa50ff-5a41-42b0-a10e-26ba1cbcd974.labels" -}}
helm.sh/chart: {{ include "go-echod9aa50ff-5a41-42b0-a10e-26ba1cbcd974.chart" . }}
{{ include "go-echod9aa50ff-5a41-42b0-a10e-26ba1cbcd974.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod9aa50ff-5a41-42b0-a10e-26ba1cbcd974.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod9aa50ff-5a41-42b0-a10e-26ba1cbcd974.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}