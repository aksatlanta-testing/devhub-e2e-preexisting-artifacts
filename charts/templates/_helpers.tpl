
{{- define "go-echod67acde6-3bb7-4c83-9e7d-0596ec33c10b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod67acde6-3bb7-4c83-9e7d-0596ec33c10b.fullname" -}}
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


{{- define "go-echod67acde6-3bb7-4c83-9e7d-0596ec33c10b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod67acde6-3bb7-4c83-9e7d-0596ec33c10b.labels" -}}
helm.sh/chart: {{ include "go-echod67acde6-3bb7-4c83-9e7d-0596ec33c10b.chart" . }}
{{ include "go-echod67acde6-3bb7-4c83-9e7d-0596ec33c10b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod67acde6-3bb7-4c83-9e7d-0596ec33c10b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod67acde6-3bb7-4c83-9e7d-0596ec33c10b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}