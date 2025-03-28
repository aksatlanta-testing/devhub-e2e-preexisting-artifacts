
{{- define "go-echof88c0038-9622-45e8-b753-3bf97318233e.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof88c0038-9622-45e8-b753-3bf97318233e.fullname" -}}
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


{{- define "go-echof88c0038-9622-45e8-b753-3bf97318233e.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof88c0038-9622-45e8-b753-3bf97318233e.labels" -}}
helm.sh/chart: {{ include "go-echof88c0038-9622-45e8-b753-3bf97318233e.chart" . }}
{{ include "go-echof88c0038-9622-45e8-b753-3bf97318233e.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof88c0038-9622-45e8-b753-3bf97318233e.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof88c0038-9622-45e8-b753-3bf97318233e.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}