
{{- define "go-echo8c13c1eb-93ca-4a34-9087-7b2c53231760.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo8c13c1eb-93ca-4a34-9087-7b2c53231760.fullname" -}}
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


{{- define "go-echo8c13c1eb-93ca-4a34-9087-7b2c53231760.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo8c13c1eb-93ca-4a34-9087-7b2c53231760.labels" -}}
helm.sh/chart: {{ include "go-echo8c13c1eb-93ca-4a34-9087-7b2c53231760.chart" . }}
{{ include "go-echo8c13c1eb-93ca-4a34-9087-7b2c53231760.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo8c13c1eb-93ca-4a34-9087-7b2c53231760.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo8c13c1eb-93ca-4a34-9087-7b2c53231760.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}