
{{- define "go-echof005488c-e1e7-417d-bb68-5cec79b80eeb.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof005488c-e1e7-417d-bb68-5cec79b80eeb.fullname" -}}
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


{{- define "go-echof005488c-e1e7-417d-bb68-5cec79b80eeb.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof005488c-e1e7-417d-bb68-5cec79b80eeb.labels" -}}
helm.sh/chart: {{ include "go-echof005488c-e1e7-417d-bb68-5cec79b80eeb.chart" . }}
{{ include "go-echof005488c-e1e7-417d-bb68-5cec79b80eeb.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof005488c-e1e7-417d-bb68-5cec79b80eeb.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof005488c-e1e7-417d-bb68-5cec79b80eeb.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}