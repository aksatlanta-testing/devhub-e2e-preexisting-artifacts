
{{- define "go-echo5ece1393-bdb6-4df0-a548-7fd7735d2419.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo5ece1393-bdb6-4df0-a548-7fd7735d2419.fullname" -}}
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


{{- define "go-echo5ece1393-bdb6-4df0-a548-7fd7735d2419.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo5ece1393-bdb6-4df0-a548-7fd7735d2419.labels" -}}
helm.sh/chart: {{ include "go-echo5ece1393-bdb6-4df0-a548-7fd7735d2419.chart" . }}
{{ include "go-echo5ece1393-bdb6-4df0-a548-7fd7735d2419.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo5ece1393-bdb6-4df0-a548-7fd7735d2419.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo5ece1393-bdb6-4df0-a548-7fd7735d2419.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}