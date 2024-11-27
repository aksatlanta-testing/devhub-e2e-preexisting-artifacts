
{{- define "go-echo752dad10-17a2-4dd7-8696-5d6bdf2a6675.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo752dad10-17a2-4dd7-8696-5d6bdf2a6675.fullname" -}}
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


{{- define "go-echo752dad10-17a2-4dd7-8696-5d6bdf2a6675.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo752dad10-17a2-4dd7-8696-5d6bdf2a6675.labels" -}}
helm.sh/chart: {{ include "go-echo752dad10-17a2-4dd7-8696-5d6bdf2a6675.chart" . }}
{{ include "go-echo752dad10-17a2-4dd7-8696-5d6bdf2a6675.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo752dad10-17a2-4dd7-8696-5d6bdf2a6675.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo752dad10-17a2-4dd7-8696-5d6bdf2a6675.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}