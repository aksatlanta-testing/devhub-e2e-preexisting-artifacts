
{{- define "go-echo47390e74-8547-4d36-8f86-6d02d33d12f1.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo47390e74-8547-4d36-8f86-6d02d33d12f1.fullname" -}}
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


{{- define "go-echo47390e74-8547-4d36-8f86-6d02d33d12f1.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo47390e74-8547-4d36-8f86-6d02d33d12f1.labels" -}}
helm.sh/chart: {{ include "go-echo47390e74-8547-4d36-8f86-6d02d33d12f1.chart" . }}
{{ include "go-echo47390e74-8547-4d36-8f86-6d02d33d12f1.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo47390e74-8547-4d36-8f86-6d02d33d12f1.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo47390e74-8547-4d36-8f86-6d02d33d12f1.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}