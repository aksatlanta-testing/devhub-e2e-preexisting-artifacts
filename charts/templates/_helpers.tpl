
{{- define "go-echod775fa8f-a60d-4a9a-a0dc-36f8baa7aaef.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod775fa8f-a60d-4a9a-a0dc-36f8baa7aaef.fullname" -}}
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


{{- define "go-echod775fa8f-a60d-4a9a-a0dc-36f8baa7aaef.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod775fa8f-a60d-4a9a-a0dc-36f8baa7aaef.labels" -}}
helm.sh/chart: {{ include "go-echod775fa8f-a60d-4a9a-a0dc-36f8baa7aaef.chart" . }}
{{ include "go-echod775fa8f-a60d-4a9a-a0dc-36f8baa7aaef.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod775fa8f-a60d-4a9a-a0dc-36f8baa7aaef.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod775fa8f-a60d-4a9a-a0dc-36f8baa7aaef.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}