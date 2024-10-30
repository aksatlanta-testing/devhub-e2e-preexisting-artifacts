
{{- define "go-echo52c7b0d5-5fe0-4872-b54c-f688c5dfb66c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo52c7b0d5-5fe0-4872-b54c-f688c5dfb66c.fullname" -}}
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


{{- define "go-echo52c7b0d5-5fe0-4872-b54c-f688c5dfb66c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo52c7b0d5-5fe0-4872-b54c-f688c5dfb66c.labels" -}}
helm.sh/chart: {{ include "go-echo52c7b0d5-5fe0-4872-b54c-f688c5dfb66c.chart" . }}
{{ include "go-echo52c7b0d5-5fe0-4872-b54c-f688c5dfb66c.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo52c7b0d5-5fe0-4872-b54c-f688c5dfb66c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo52c7b0d5-5fe0-4872-b54c-f688c5dfb66c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}