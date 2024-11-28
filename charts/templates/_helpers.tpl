
{{- define "go-echo28ca6cdf-7e9f-4608-9a25-f1c262da21ad.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo28ca6cdf-7e9f-4608-9a25-f1c262da21ad.fullname" -}}
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


{{- define "go-echo28ca6cdf-7e9f-4608-9a25-f1c262da21ad.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo28ca6cdf-7e9f-4608-9a25-f1c262da21ad.labels" -}}
helm.sh/chart: {{ include "go-echo28ca6cdf-7e9f-4608-9a25-f1c262da21ad.chart" . }}
{{ include "go-echo28ca6cdf-7e9f-4608-9a25-f1c262da21ad.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo28ca6cdf-7e9f-4608-9a25-f1c262da21ad.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo28ca6cdf-7e9f-4608-9a25-f1c262da21ad.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}