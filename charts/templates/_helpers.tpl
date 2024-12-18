
{{- define "go-echo970feed7-a8c1-4b99-a6d2-7a79e6c7e821.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo970feed7-a8c1-4b99-a6d2-7a79e6c7e821.fullname" -}}
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


{{- define "go-echo970feed7-a8c1-4b99-a6d2-7a79e6c7e821.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo970feed7-a8c1-4b99-a6d2-7a79e6c7e821.labels" -}}
helm.sh/chart: {{ include "go-echo970feed7-a8c1-4b99-a6d2-7a79e6c7e821.chart" . }}
{{ include "go-echo970feed7-a8c1-4b99-a6d2-7a79e6c7e821.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo970feed7-a8c1-4b99-a6d2-7a79e6c7e821.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo970feed7-a8c1-4b99-a6d2-7a79e6c7e821.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}