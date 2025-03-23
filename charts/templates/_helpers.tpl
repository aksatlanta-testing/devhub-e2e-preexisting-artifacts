
{{- define "go-echo47677471-2d7a-4840-a87e-17f9eb9ac221.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo47677471-2d7a-4840-a87e-17f9eb9ac221.fullname" -}}
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


{{- define "go-echo47677471-2d7a-4840-a87e-17f9eb9ac221.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo47677471-2d7a-4840-a87e-17f9eb9ac221.labels" -}}
helm.sh/chart: {{ include "go-echo47677471-2d7a-4840-a87e-17f9eb9ac221.chart" . }}
{{ include "go-echo47677471-2d7a-4840-a87e-17f9eb9ac221.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo47677471-2d7a-4840-a87e-17f9eb9ac221.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo47677471-2d7a-4840-a87e-17f9eb9ac221.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}