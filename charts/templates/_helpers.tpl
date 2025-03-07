
{{- define "go-echo39f49d3a-4f16-4de7-a81a-ddcf761cbd00.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo39f49d3a-4f16-4de7-a81a-ddcf761cbd00.fullname" -}}
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


{{- define "go-echo39f49d3a-4f16-4de7-a81a-ddcf761cbd00.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo39f49d3a-4f16-4de7-a81a-ddcf761cbd00.labels" -}}
helm.sh/chart: {{ include "go-echo39f49d3a-4f16-4de7-a81a-ddcf761cbd00.chart" . }}
{{ include "go-echo39f49d3a-4f16-4de7-a81a-ddcf761cbd00.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo39f49d3a-4f16-4de7-a81a-ddcf761cbd00.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo39f49d3a-4f16-4de7-a81a-ddcf761cbd00.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}