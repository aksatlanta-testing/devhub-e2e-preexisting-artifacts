
{{- define "go-echo1d436a79-d785-4012-b709-b28a76c8dfab.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo1d436a79-d785-4012-b709-b28a76c8dfab.fullname" -}}
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


{{- define "go-echo1d436a79-d785-4012-b709-b28a76c8dfab.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo1d436a79-d785-4012-b709-b28a76c8dfab.labels" -}}
helm.sh/chart: {{ include "go-echo1d436a79-d785-4012-b709-b28a76c8dfab.chart" . }}
{{ include "go-echo1d436a79-d785-4012-b709-b28a76c8dfab.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo1d436a79-d785-4012-b709-b28a76c8dfab.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo1d436a79-d785-4012-b709-b28a76c8dfab.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}