
{{- define "go-echo144caa50-ecd0-41cf-aef3-f463ba4d92bb.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo144caa50-ecd0-41cf-aef3-f463ba4d92bb.fullname" -}}
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


{{- define "go-echo144caa50-ecd0-41cf-aef3-f463ba4d92bb.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo144caa50-ecd0-41cf-aef3-f463ba4d92bb.labels" -}}
helm.sh/chart: {{ include "go-echo144caa50-ecd0-41cf-aef3-f463ba4d92bb.chart" . }}
{{ include "go-echo144caa50-ecd0-41cf-aef3-f463ba4d92bb.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo144caa50-ecd0-41cf-aef3-f463ba4d92bb.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo144caa50-ecd0-41cf-aef3-f463ba4d92bb.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}