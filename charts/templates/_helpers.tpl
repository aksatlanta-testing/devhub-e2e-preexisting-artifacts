
{{- define "go-echof640a176-09b5-48ef-b86e-fa14a5032912.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof640a176-09b5-48ef-b86e-fa14a5032912.fullname" -}}
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


{{- define "go-echof640a176-09b5-48ef-b86e-fa14a5032912.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof640a176-09b5-48ef-b86e-fa14a5032912.labels" -}}
helm.sh/chart: {{ include "go-echof640a176-09b5-48ef-b86e-fa14a5032912.chart" . }}
{{ include "go-echof640a176-09b5-48ef-b86e-fa14a5032912.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof640a176-09b5-48ef-b86e-fa14a5032912.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof640a176-09b5-48ef-b86e-fa14a5032912.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}