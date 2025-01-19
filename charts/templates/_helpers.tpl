
{{- define "go-echodd080550-aa9b-4730-a8fe-1c1d9e0bc072.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodd080550-aa9b-4730-a8fe-1c1d9e0bc072.fullname" -}}
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


{{- define "go-echodd080550-aa9b-4730-a8fe-1c1d9e0bc072.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodd080550-aa9b-4730-a8fe-1c1d9e0bc072.labels" -}}
helm.sh/chart: {{ include "go-echodd080550-aa9b-4730-a8fe-1c1d9e0bc072.chart" . }}
{{ include "go-echodd080550-aa9b-4730-a8fe-1c1d9e0bc072.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echodd080550-aa9b-4730-a8fe-1c1d9e0bc072.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echodd080550-aa9b-4730-a8fe-1c1d9e0bc072.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}