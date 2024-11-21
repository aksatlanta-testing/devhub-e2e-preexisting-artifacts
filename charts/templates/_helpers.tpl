
{{- define "go-echof5c3df9e-4d9f-4fbc-ac6b-2cc6a7ee1eed.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof5c3df9e-4d9f-4fbc-ac6b-2cc6a7ee1eed.fullname" -}}
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


{{- define "go-echof5c3df9e-4d9f-4fbc-ac6b-2cc6a7ee1eed.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof5c3df9e-4d9f-4fbc-ac6b-2cc6a7ee1eed.labels" -}}
helm.sh/chart: {{ include "go-echof5c3df9e-4d9f-4fbc-ac6b-2cc6a7ee1eed.chart" . }}
{{ include "go-echof5c3df9e-4d9f-4fbc-ac6b-2cc6a7ee1eed.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof5c3df9e-4d9f-4fbc-ac6b-2cc6a7ee1eed.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof5c3df9e-4d9f-4fbc-ac6b-2cc6a7ee1eed.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}