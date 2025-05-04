
{{- define "go-echoa62c8246-a4b6-43b6-841c-5c742f87e976.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa62c8246-a4b6-43b6-841c-5c742f87e976.fullname" -}}
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


{{- define "go-echoa62c8246-a4b6-43b6-841c-5c742f87e976.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa62c8246-a4b6-43b6-841c-5c742f87e976.labels" -}}
helm.sh/chart: {{ include "go-echoa62c8246-a4b6-43b6-841c-5c742f87e976.chart" . }}
{{ include "go-echoa62c8246-a4b6-43b6-841c-5c742f87e976.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa62c8246-a4b6-43b6-841c-5c742f87e976.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa62c8246-a4b6-43b6-841c-5c742f87e976.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}