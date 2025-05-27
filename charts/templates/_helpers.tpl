
{{- define "go-echod6cac41d-55cb-45fa-a118-7ead9ee9311b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod6cac41d-55cb-45fa-a118-7ead9ee9311b.fullname" -}}
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


{{- define "go-echod6cac41d-55cb-45fa-a118-7ead9ee9311b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod6cac41d-55cb-45fa-a118-7ead9ee9311b.labels" -}}
helm.sh/chart: {{ include "go-echod6cac41d-55cb-45fa-a118-7ead9ee9311b.chart" . }}
{{ include "go-echod6cac41d-55cb-45fa-a118-7ead9ee9311b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod6cac41d-55cb-45fa-a118-7ead9ee9311b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod6cac41d-55cb-45fa-a118-7ead9ee9311b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}