
{{- define "go-echo2c64a751-28a3-44a6-8dd7-c8f9a94511ee.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo2c64a751-28a3-44a6-8dd7-c8f9a94511ee.fullname" -}}
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


{{- define "go-echo2c64a751-28a3-44a6-8dd7-c8f9a94511ee.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo2c64a751-28a3-44a6-8dd7-c8f9a94511ee.labels" -}}
helm.sh/chart: {{ include "go-echo2c64a751-28a3-44a6-8dd7-c8f9a94511ee.chart" . }}
{{ include "go-echo2c64a751-28a3-44a6-8dd7-c8f9a94511ee.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo2c64a751-28a3-44a6-8dd7-c8f9a94511ee.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo2c64a751-28a3-44a6-8dd7-c8f9a94511ee.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}