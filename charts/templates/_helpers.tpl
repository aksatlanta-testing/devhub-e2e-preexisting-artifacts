
{{- define "go-echo923dbd94-fa78-48ce-bcf1-2cd1a6b1a211.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo923dbd94-fa78-48ce-bcf1-2cd1a6b1a211.fullname" -}}
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


{{- define "go-echo923dbd94-fa78-48ce-bcf1-2cd1a6b1a211.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo923dbd94-fa78-48ce-bcf1-2cd1a6b1a211.labels" -}}
helm.sh/chart: {{ include "go-echo923dbd94-fa78-48ce-bcf1-2cd1a6b1a211.chart" . }}
{{ include "go-echo923dbd94-fa78-48ce-bcf1-2cd1a6b1a211.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo923dbd94-fa78-48ce-bcf1-2cd1a6b1a211.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo923dbd94-fa78-48ce-bcf1-2cd1a6b1a211.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}