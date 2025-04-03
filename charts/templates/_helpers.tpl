
{{- define "go-echoe6645e57-e7f5-4f02-9116-ebde3a9496ce.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe6645e57-e7f5-4f02-9116-ebde3a9496ce.fullname" -}}
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


{{- define "go-echoe6645e57-e7f5-4f02-9116-ebde3a9496ce.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe6645e57-e7f5-4f02-9116-ebde3a9496ce.labels" -}}
helm.sh/chart: {{ include "go-echoe6645e57-e7f5-4f02-9116-ebde3a9496ce.chart" . }}
{{ include "go-echoe6645e57-e7f5-4f02-9116-ebde3a9496ce.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoe6645e57-e7f5-4f02-9116-ebde3a9496ce.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoe6645e57-e7f5-4f02-9116-ebde3a9496ce.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}