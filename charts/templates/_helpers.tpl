
{{- define "go-echo3b9b0af7-8dcf-4ec8-b61d-e37c9f5eb91c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo3b9b0af7-8dcf-4ec8-b61d-e37c9f5eb91c.fullname" -}}
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


{{- define "go-echo3b9b0af7-8dcf-4ec8-b61d-e37c9f5eb91c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo3b9b0af7-8dcf-4ec8-b61d-e37c9f5eb91c.labels" -}}
helm.sh/chart: {{ include "go-echo3b9b0af7-8dcf-4ec8-b61d-e37c9f5eb91c.chart" . }}
{{ include "go-echo3b9b0af7-8dcf-4ec8-b61d-e37c9f5eb91c.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo3b9b0af7-8dcf-4ec8-b61d-e37c9f5eb91c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo3b9b0af7-8dcf-4ec8-b61d-e37c9f5eb91c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}