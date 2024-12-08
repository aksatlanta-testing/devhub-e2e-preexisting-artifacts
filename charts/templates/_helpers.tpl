
{{- define "go-echo6a1ea31f-6f81-42d7-be48-3cb220b7c5ed.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo6a1ea31f-6f81-42d7-be48-3cb220b7c5ed.fullname" -}}
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


{{- define "go-echo6a1ea31f-6f81-42d7-be48-3cb220b7c5ed.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo6a1ea31f-6f81-42d7-be48-3cb220b7c5ed.labels" -}}
helm.sh/chart: {{ include "go-echo6a1ea31f-6f81-42d7-be48-3cb220b7c5ed.chart" . }}
{{ include "go-echo6a1ea31f-6f81-42d7-be48-3cb220b7c5ed.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo6a1ea31f-6f81-42d7-be48-3cb220b7c5ed.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo6a1ea31f-6f81-42d7-be48-3cb220b7c5ed.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}