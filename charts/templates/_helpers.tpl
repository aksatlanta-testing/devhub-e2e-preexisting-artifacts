
{{- define "go-echoad4a9272-9d54-4150-826a-d14e3dee4b4c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoad4a9272-9d54-4150-826a-d14e3dee4b4c.fullname" -}}
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


{{- define "go-echoad4a9272-9d54-4150-826a-d14e3dee4b4c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoad4a9272-9d54-4150-826a-d14e3dee4b4c.labels" -}}
helm.sh/chart: {{ include "go-echoad4a9272-9d54-4150-826a-d14e3dee4b4c.chart" . }}
{{ include "go-echoad4a9272-9d54-4150-826a-d14e3dee4b4c.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoad4a9272-9d54-4150-826a-d14e3dee4b4c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoad4a9272-9d54-4150-826a-d14e3dee4b4c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}