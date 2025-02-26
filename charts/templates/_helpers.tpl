
{{- define "go-echodfb610bc-a241-459d-b59d-be4c587773bd.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodfb610bc-a241-459d-b59d-be4c587773bd.fullname" -}}
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


{{- define "go-echodfb610bc-a241-459d-b59d-be4c587773bd.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodfb610bc-a241-459d-b59d-be4c587773bd.labels" -}}
helm.sh/chart: {{ include "go-echodfb610bc-a241-459d-b59d-be4c587773bd.chart" . }}
{{ include "go-echodfb610bc-a241-459d-b59d-be4c587773bd.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echodfb610bc-a241-459d-b59d-be4c587773bd.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echodfb610bc-a241-459d-b59d-be4c587773bd.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}