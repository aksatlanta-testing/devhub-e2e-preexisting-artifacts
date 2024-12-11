
{{- define "go-echo720228c0-2f46-45b7-9c01-82c96880d09e.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo720228c0-2f46-45b7-9c01-82c96880d09e.fullname" -}}
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


{{- define "go-echo720228c0-2f46-45b7-9c01-82c96880d09e.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo720228c0-2f46-45b7-9c01-82c96880d09e.labels" -}}
helm.sh/chart: {{ include "go-echo720228c0-2f46-45b7-9c01-82c96880d09e.chart" . }}
{{ include "go-echo720228c0-2f46-45b7-9c01-82c96880d09e.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo720228c0-2f46-45b7-9c01-82c96880d09e.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo720228c0-2f46-45b7-9c01-82c96880d09e.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}