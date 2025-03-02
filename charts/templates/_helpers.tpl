
{{- define "go-echoc7bb51d5-6456-40cf-b82b-6f4c22cadd3d.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc7bb51d5-6456-40cf-b82b-6f4c22cadd3d.fullname" -}}
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


{{- define "go-echoc7bb51d5-6456-40cf-b82b-6f4c22cadd3d.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc7bb51d5-6456-40cf-b82b-6f4c22cadd3d.labels" -}}
helm.sh/chart: {{ include "go-echoc7bb51d5-6456-40cf-b82b-6f4c22cadd3d.chart" . }}
{{ include "go-echoc7bb51d5-6456-40cf-b82b-6f4c22cadd3d.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoc7bb51d5-6456-40cf-b82b-6f4c22cadd3d.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoc7bb51d5-6456-40cf-b82b-6f4c22cadd3d.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}