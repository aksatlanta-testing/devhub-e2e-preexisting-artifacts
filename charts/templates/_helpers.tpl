
{{- define "go-echocf434704-fc02-4634-96f0-2cb7ae0ac1fb.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocf434704-fc02-4634-96f0-2cb7ae0ac1fb.fullname" -}}
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


{{- define "go-echocf434704-fc02-4634-96f0-2cb7ae0ac1fb.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocf434704-fc02-4634-96f0-2cb7ae0ac1fb.labels" -}}
helm.sh/chart: {{ include "go-echocf434704-fc02-4634-96f0-2cb7ae0ac1fb.chart" . }}
{{ include "go-echocf434704-fc02-4634-96f0-2cb7ae0ac1fb.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echocf434704-fc02-4634-96f0-2cb7ae0ac1fb.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echocf434704-fc02-4634-96f0-2cb7ae0ac1fb.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}