
{{- define "go-echo8c2bc6b5-1001-42f5-ab32-424f322bbbdc.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo8c2bc6b5-1001-42f5-ab32-424f322bbbdc.fullname" -}}
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


{{- define "go-echo8c2bc6b5-1001-42f5-ab32-424f322bbbdc.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo8c2bc6b5-1001-42f5-ab32-424f322bbbdc.labels" -}}
helm.sh/chart: {{ include "go-echo8c2bc6b5-1001-42f5-ab32-424f322bbbdc.chart" . }}
{{ include "go-echo8c2bc6b5-1001-42f5-ab32-424f322bbbdc.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo8c2bc6b5-1001-42f5-ab32-424f322bbbdc.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo8c2bc6b5-1001-42f5-ab32-424f322bbbdc.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}