
{{- define "go-echod0aa6606-3628-41d3-b37c-565e3b0ba400.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod0aa6606-3628-41d3-b37c-565e3b0ba400.fullname" -}}
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


{{- define "go-echod0aa6606-3628-41d3-b37c-565e3b0ba400.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod0aa6606-3628-41d3-b37c-565e3b0ba400.labels" -}}
helm.sh/chart: {{ include "go-echod0aa6606-3628-41d3-b37c-565e3b0ba400.chart" . }}
{{ include "go-echod0aa6606-3628-41d3-b37c-565e3b0ba400.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod0aa6606-3628-41d3-b37c-565e3b0ba400.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod0aa6606-3628-41d3-b37c-565e3b0ba400.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}