
{{- define "go-echo06513d22-a021-428f-a044-74e0b6757608.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo06513d22-a021-428f-a044-74e0b6757608.fullname" -}}
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


{{- define "go-echo06513d22-a021-428f-a044-74e0b6757608.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo06513d22-a021-428f-a044-74e0b6757608.labels" -}}
helm.sh/chart: {{ include "go-echo06513d22-a021-428f-a044-74e0b6757608.chart" . }}
{{ include "go-echo06513d22-a021-428f-a044-74e0b6757608.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo06513d22-a021-428f-a044-74e0b6757608.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo06513d22-a021-428f-a044-74e0b6757608.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}