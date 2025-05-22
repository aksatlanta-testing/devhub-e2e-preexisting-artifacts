
{{- define "go-echoa47a9513-5ce5-4fe7-8681-2194ea405501.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa47a9513-5ce5-4fe7-8681-2194ea405501.fullname" -}}
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


{{- define "go-echoa47a9513-5ce5-4fe7-8681-2194ea405501.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa47a9513-5ce5-4fe7-8681-2194ea405501.labels" -}}
helm.sh/chart: {{ include "go-echoa47a9513-5ce5-4fe7-8681-2194ea405501.chart" . }}
{{ include "go-echoa47a9513-5ce5-4fe7-8681-2194ea405501.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa47a9513-5ce5-4fe7-8681-2194ea405501.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa47a9513-5ce5-4fe7-8681-2194ea405501.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}