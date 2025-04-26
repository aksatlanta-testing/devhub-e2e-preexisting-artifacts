
{{- define "go-echof8d92683-0564-48c3-b0d8-da0e178d866d.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof8d92683-0564-48c3-b0d8-da0e178d866d.fullname" -}}
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


{{- define "go-echof8d92683-0564-48c3-b0d8-da0e178d866d.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof8d92683-0564-48c3-b0d8-da0e178d866d.labels" -}}
helm.sh/chart: {{ include "go-echof8d92683-0564-48c3-b0d8-da0e178d866d.chart" . }}
{{ include "go-echof8d92683-0564-48c3-b0d8-da0e178d866d.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof8d92683-0564-48c3-b0d8-da0e178d866d.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof8d92683-0564-48c3-b0d8-da0e178d866d.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}