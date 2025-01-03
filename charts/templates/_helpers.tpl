
{{- define "go-echo597f4777-3b31-4fda-9c92-b8ed5103edae.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo597f4777-3b31-4fda-9c92-b8ed5103edae.fullname" -}}
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


{{- define "go-echo597f4777-3b31-4fda-9c92-b8ed5103edae.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo597f4777-3b31-4fda-9c92-b8ed5103edae.labels" -}}
helm.sh/chart: {{ include "go-echo597f4777-3b31-4fda-9c92-b8ed5103edae.chart" . }}
{{ include "go-echo597f4777-3b31-4fda-9c92-b8ed5103edae.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo597f4777-3b31-4fda-9c92-b8ed5103edae.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo597f4777-3b31-4fda-9c92-b8ed5103edae.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}