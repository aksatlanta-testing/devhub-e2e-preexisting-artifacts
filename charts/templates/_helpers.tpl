
{{- define "go-echo0f972754-1a38-48b7-903d-90c673d8dc37.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo0f972754-1a38-48b7-903d-90c673d8dc37.fullname" -}}
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


{{- define "go-echo0f972754-1a38-48b7-903d-90c673d8dc37.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo0f972754-1a38-48b7-903d-90c673d8dc37.labels" -}}
helm.sh/chart: {{ include "go-echo0f972754-1a38-48b7-903d-90c673d8dc37.chart" . }}
{{ include "go-echo0f972754-1a38-48b7-903d-90c673d8dc37.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo0f972754-1a38-48b7-903d-90c673d8dc37.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo0f972754-1a38-48b7-903d-90c673d8dc37.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}