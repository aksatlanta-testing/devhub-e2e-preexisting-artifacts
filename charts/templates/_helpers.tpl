
{{- define "go-echoda0bb6d3-04b6-4d44-a405-6126d2b837fc.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoda0bb6d3-04b6-4d44-a405-6126d2b837fc.fullname" -}}
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


{{- define "go-echoda0bb6d3-04b6-4d44-a405-6126d2b837fc.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoda0bb6d3-04b6-4d44-a405-6126d2b837fc.labels" -}}
helm.sh/chart: {{ include "go-echoda0bb6d3-04b6-4d44-a405-6126d2b837fc.chart" . }}
{{ include "go-echoda0bb6d3-04b6-4d44-a405-6126d2b837fc.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoda0bb6d3-04b6-4d44-a405-6126d2b837fc.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoda0bb6d3-04b6-4d44-a405-6126d2b837fc.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}