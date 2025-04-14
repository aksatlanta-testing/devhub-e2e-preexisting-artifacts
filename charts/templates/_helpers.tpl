
{{- define "go-echo55414c41-7c75-4553-b4e3-c591479bb63e.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo55414c41-7c75-4553-b4e3-c591479bb63e.fullname" -}}
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


{{- define "go-echo55414c41-7c75-4553-b4e3-c591479bb63e.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo55414c41-7c75-4553-b4e3-c591479bb63e.labels" -}}
helm.sh/chart: {{ include "go-echo55414c41-7c75-4553-b4e3-c591479bb63e.chart" . }}
{{ include "go-echo55414c41-7c75-4553-b4e3-c591479bb63e.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo55414c41-7c75-4553-b4e3-c591479bb63e.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo55414c41-7c75-4553-b4e3-c591479bb63e.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}