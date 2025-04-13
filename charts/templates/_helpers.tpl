
{{- define "go-echoa0dada42-1e05-4475-bec0-7c3226d56778.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa0dada42-1e05-4475-bec0-7c3226d56778.fullname" -}}
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


{{- define "go-echoa0dada42-1e05-4475-bec0-7c3226d56778.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa0dada42-1e05-4475-bec0-7c3226d56778.labels" -}}
helm.sh/chart: {{ include "go-echoa0dada42-1e05-4475-bec0-7c3226d56778.chart" . }}
{{ include "go-echoa0dada42-1e05-4475-bec0-7c3226d56778.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa0dada42-1e05-4475-bec0-7c3226d56778.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa0dada42-1e05-4475-bec0-7c3226d56778.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}