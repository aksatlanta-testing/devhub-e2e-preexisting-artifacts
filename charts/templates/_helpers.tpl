
{{- define "go-echobf74a9ab-4418-4b03-ad82-72f467666699.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobf74a9ab-4418-4b03-ad82-72f467666699.fullname" -}}
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


{{- define "go-echobf74a9ab-4418-4b03-ad82-72f467666699.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobf74a9ab-4418-4b03-ad82-72f467666699.labels" -}}
helm.sh/chart: {{ include "go-echobf74a9ab-4418-4b03-ad82-72f467666699.chart" . }}
{{ include "go-echobf74a9ab-4418-4b03-ad82-72f467666699.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echobf74a9ab-4418-4b03-ad82-72f467666699.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echobf74a9ab-4418-4b03-ad82-72f467666699.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}