
{{- define "go-echo69348033-9c56-4050-ab33-a88744a1f3be.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo69348033-9c56-4050-ab33-a88744a1f3be.fullname" -}}
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


{{- define "go-echo69348033-9c56-4050-ab33-a88744a1f3be.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo69348033-9c56-4050-ab33-a88744a1f3be.labels" -}}
helm.sh/chart: {{ include "go-echo69348033-9c56-4050-ab33-a88744a1f3be.chart" . }}
{{ include "go-echo69348033-9c56-4050-ab33-a88744a1f3be.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo69348033-9c56-4050-ab33-a88744a1f3be.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo69348033-9c56-4050-ab33-a88744a1f3be.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}