
{{- define "go-echoe5f932fc-fbe0-4b47-9d5c-be96ce493cee.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe5f932fc-fbe0-4b47-9d5c-be96ce493cee.fullname" -}}
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


{{- define "go-echoe5f932fc-fbe0-4b47-9d5c-be96ce493cee.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe5f932fc-fbe0-4b47-9d5c-be96ce493cee.labels" -}}
helm.sh/chart: {{ include "go-echoe5f932fc-fbe0-4b47-9d5c-be96ce493cee.chart" . }}
{{ include "go-echoe5f932fc-fbe0-4b47-9d5c-be96ce493cee.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoe5f932fc-fbe0-4b47-9d5c-be96ce493cee.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoe5f932fc-fbe0-4b47-9d5c-be96ce493cee.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}