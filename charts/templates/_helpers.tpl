
{{- define "go-echob7045f42-dc83-4566-8409-945cf99d9fee.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob7045f42-dc83-4566-8409-945cf99d9fee.fullname" -}}
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


{{- define "go-echob7045f42-dc83-4566-8409-945cf99d9fee.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob7045f42-dc83-4566-8409-945cf99d9fee.labels" -}}
helm.sh/chart: {{ include "go-echob7045f42-dc83-4566-8409-945cf99d9fee.chart" . }}
{{ include "go-echob7045f42-dc83-4566-8409-945cf99d9fee.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echob7045f42-dc83-4566-8409-945cf99d9fee.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echob7045f42-dc83-4566-8409-945cf99d9fee.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}