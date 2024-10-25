
{{- define "go-echod8334fc0-d9d1-4541-ae26-1686bcc3c182.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod8334fc0-d9d1-4541-ae26-1686bcc3c182.fullname" -}}
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


{{- define "go-echod8334fc0-d9d1-4541-ae26-1686bcc3c182.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod8334fc0-d9d1-4541-ae26-1686bcc3c182.labels" -}}
helm.sh/chart: {{ include "go-echod8334fc0-d9d1-4541-ae26-1686bcc3c182.chart" . }}
{{ include "go-echod8334fc0-d9d1-4541-ae26-1686bcc3c182.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod8334fc0-d9d1-4541-ae26-1686bcc3c182.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod8334fc0-d9d1-4541-ae26-1686bcc3c182.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}