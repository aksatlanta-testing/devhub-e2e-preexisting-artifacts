
{{- define "go-echof8651f55-add4-4910-9948-de62bed73b38.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof8651f55-add4-4910-9948-de62bed73b38.fullname" -}}
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


{{- define "go-echof8651f55-add4-4910-9948-de62bed73b38.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof8651f55-add4-4910-9948-de62bed73b38.labels" -}}
helm.sh/chart: {{ include "go-echof8651f55-add4-4910-9948-de62bed73b38.chart" . }}
{{ include "go-echof8651f55-add4-4910-9948-de62bed73b38.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof8651f55-add4-4910-9948-de62bed73b38.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof8651f55-add4-4910-9948-de62bed73b38.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}