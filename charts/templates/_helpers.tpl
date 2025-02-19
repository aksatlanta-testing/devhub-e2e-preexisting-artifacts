
{{- define "go-echo2bdcab4a-4d87-43bf-9bcc-a2204239153f.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo2bdcab4a-4d87-43bf-9bcc-a2204239153f.fullname" -}}
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


{{- define "go-echo2bdcab4a-4d87-43bf-9bcc-a2204239153f.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo2bdcab4a-4d87-43bf-9bcc-a2204239153f.labels" -}}
helm.sh/chart: {{ include "go-echo2bdcab4a-4d87-43bf-9bcc-a2204239153f.chart" . }}
{{ include "go-echo2bdcab4a-4d87-43bf-9bcc-a2204239153f.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo2bdcab4a-4d87-43bf-9bcc-a2204239153f.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo2bdcab4a-4d87-43bf-9bcc-a2204239153f.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}