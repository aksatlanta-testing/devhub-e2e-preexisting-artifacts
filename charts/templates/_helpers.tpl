
{{- define "go-echoe1d764f4-7ecd-4272-a4e5-276e16000a5d.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe1d764f4-7ecd-4272-a4e5-276e16000a5d.fullname" -}}
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


{{- define "go-echoe1d764f4-7ecd-4272-a4e5-276e16000a5d.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe1d764f4-7ecd-4272-a4e5-276e16000a5d.labels" -}}
helm.sh/chart: {{ include "go-echoe1d764f4-7ecd-4272-a4e5-276e16000a5d.chart" . }}
{{ include "go-echoe1d764f4-7ecd-4272-a4e5-276e16000a5d.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoe1d764f4-7ecd-4272-a4e5-276e16000a5d.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoe1d764f4-7ecd-4272-a4e5-276e16000a5d.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}