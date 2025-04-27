
{{- define "go-echoc8571fd9-086a-48c6-aa9b-b75d88951afd.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc8571fd9-086a-48c6-aa9b-b75d88951afd.fullname" -}}
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


{{- define "go-echoc8571fd9-086a-48c6-aa9b-b75d88951afd.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc8571fd9-086a-48c6-aa9b-b75d88951afd.labels" -}}
helm.sh/chart: {{ include "go-echoc8571fd9-086a-48c6-aa9b-b75d88951afd.chart" . }}
{{ include "go-echoc8571fd9-086a-48c6-aa9b-b75d88951afd.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoc8571fd9-086a-48c6-aa9b-b75d88951afd.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoc8571fd9-086a-48c6-aa9b-b75d88951afd.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}