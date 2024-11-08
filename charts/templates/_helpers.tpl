
{{- define "go-echo88a0690e-4ea0-47c1-91e1-760f0e844f19.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo88a0690e-4ea0-47c1-91e1-760f0e844f19.fullname" -}}
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


{{- define "go-echo88a0690e-4ea0-47c1-91e1-760f0e844f19.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo88a0690e-4ea0-47c1-91e1-760f0e844f19.labels" -}}
helm.sh/chart: {{ include "go-echo88a0690e-4ea0-47c1-91e1-760f0e844f19.chart" . }}
{{ include "go-echo88a0690e-4ea0-47c1-91e1-760f0e844f19.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo88a0690e-4ea0-47c1-91e1-760f0e844f19.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo88a0690e-4ea0-47c1-91e1-760f0e844f19.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}