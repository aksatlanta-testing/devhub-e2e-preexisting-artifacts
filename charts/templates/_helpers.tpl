
{{- define "go-echo12f795b7-88aa-476c-9b5b-2a1d4ff42534.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo12f795b7-88aa-476c-9b5b-2a1d4ff42534.fullname" -}}
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


{{- define "go-echo12f795b7-88aa-476c-9b5b-2a1d4ff42534.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo12f795b7-88aa-476c-9b5b-2a1d4ff42534.labels" -}}
helm.sh/chart: {{ include "go-echo12f795b7-88aa-476c-9b5b-2a1d4ff42534.chart" . }}
{{ include "go-echo12f795b7-88aa-476c-9b5b-2a1d4ff42534.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo12f795b7-88aa-476c-9b5b-2a1d4ff42534.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo12f795b7-88aa-476c-9b5b-2a1d4ff42534.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}