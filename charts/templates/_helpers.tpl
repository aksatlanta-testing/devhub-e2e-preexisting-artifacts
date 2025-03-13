
{{- define "go-echobaa14e33-a5a1-40cf-b7c6-5b2d1bae9016.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobaa14e33-a5a1-40cf-b7c6-5b2d1bae9016.fullname" -}}
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


{{- define "go-echobaa14e33-a5a1-40cf-b7c6-5b2d1bae9016.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobaa14e33-a5a1-40cf-b7c6-5b2d1bae9016.labels" -}}
helm.sh/chart: {{ include "go-echobaa14e33-a5a1-40cf-b7c6-5b2d1bae9016.chart" . }}
{{ include "go-echobaa14e33-a5a1-40cf-b7c6-5b2d1bae9016.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echobaa14e33-a5a1-40cf-b7c6-5b2d1bae9016.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echobaa14e33-a5a1-40cf-b7c6-5b2d1bae9016.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}