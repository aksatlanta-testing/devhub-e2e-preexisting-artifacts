
{{- define "go-echof48b16e8-1ac8-45c5-9fc8-e7265494f950.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof48b16e8-1ac8-45c5-9fc8-e7265494f950.fullname" -}}
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


{{- define "go-echof48b16e8-1ac8-45c5-9fc8-e7265494f950.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof48b16e8-1ac8-45c5-9fc8-e7265494f950.labels" -}}
helm.sh/chart: {{ include "go-echof48b16e8-1ac8-45c5-9fc8-e7265494f950.chart" . }}
{{ include "go-echof48b16e8-1ac8-45c5-9fc8-e7265494f950.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof48b16e8-1ac8-45c5-9fc8-e7265494f950.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof48b16e8-1ac8-45c5-9fc8-e7265494f950.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}