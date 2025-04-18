
{{- define "go-echof62b1384-f3cc-4936-bffa-5ebef9968161.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof62b1384-f3cc-4936-bffa-5ebef9968161.fullname" -}}
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


{{- define "go-echof62b1384-f3cc-4936-bffa-5ebef9968161.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof62b1384-f3cc-4936-bffa-5ebef9968161.labels" -}}
helm.sh/chart: {{ include "go-echof62b1384-f3cc-4936-bffa-5ebef9968161.chart" . }}
{{ include "go-echof62b1384-f3cc-4936-bffa-5ebef9968161.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof62b1384-f3cc-4936-bffa-5ebef9968161.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof62b1384-f3cc-4936-bffa-5ebef9968161.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}