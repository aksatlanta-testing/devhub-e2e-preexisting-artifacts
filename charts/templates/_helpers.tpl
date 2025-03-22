
{{- define "go-echob73f0e72-409f-4582-a2bf-7c1ce9f9b98e.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob73f0e72-409f-4582-a2bf-7c1ce9f9b98e.fullname" -}}
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


{{- define "go-echob73f0e72-409f-4582-a2bf-7c1ce9f9b98e.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob73f0e72-409f-4582-a2bf-7c1ce9f9b98e.labels" -}}
helm.sh/chart: {{ include "go-echob73f0e72-409f-4582-a2bf-7c1ce9f9b98e.chart" . }}
{{ include "go-echob73f0e72-409f-4582-a2bf-7c1ce9f9b98e.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echob73f0e72-409f-4582-a2bf-7c1ce9f9b98e.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echob73f0e72-409f-4582-a2bf-7c1ce9f9b98e.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}