
{{- define "go-echo981bb98a-b9ae-4f36-b41a-57a6b11aa7ca.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo981bb98a-b9ae-4f36-b41a-57a6b11aa7ca.fullname" -}}
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


{{- define "go-echo981bb98a-b9ae-4f36-b41a-57a6b11aa7ca.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo981bb98a-b9ae-4f36-b41a-57a6b11aa7ca.labels" -}}
helm.sh/chart: {{ include "go-echo981bb98a-b9ae-4f36-b41a-57a6b11aa7ca.chart" . }}
{{ include "go-echo981bb98a-b9ae-4f36-b41a-57a6b11aa7ca.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo981bb98a-b9ae-4f36-b41a-57a6b11aa7ca.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo981bb98a-b9ae-4f36-b41a-57a6b11aa7ca.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}