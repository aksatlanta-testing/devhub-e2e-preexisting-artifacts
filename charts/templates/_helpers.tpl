
{{- define "go-echobc64f0ab-5cae-45fc-aee5-6a3a087330dd.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobc64f0ab-5cae-45fc-aee5-6a3a087330dd.fullname" -}}
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


{{- define "go-echobc64f0ab-5cae-45fc-aee5-6a3a087330dd.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobc64f0ab-5cae-45fc-aee5-6a3a087330dd.labels" -}}
helm.sh/chart: {{ include "go-echobc64f0ab-5cae-45fc-aee5-6a3a087330dd.chart" . }}
{{ include "go-echobc64f0ab-5cae-45fc-aee5-6a3a087330dd.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echobc64f0ab-5cae-45fc-aee5-6a3a087330dd.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echobc64f0ab-5cae-45fc-aee5-6a3a087330dd.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}