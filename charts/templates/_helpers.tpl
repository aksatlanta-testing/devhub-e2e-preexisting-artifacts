
{{- define "go-echoa96156b0-68a7-41c5-b5d8-9ed3a63498fa.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa96156b0-68a7-41c5-b5d8-9ed3a63498fa.fullname" -}}
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


{{- define "go-echoa96156b0-68a7-41c5-b5d8-9ed3a63498fa.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa96156b0-68a7-41c5-b5d8-9ed3a63498fa.labels" -}}
helm.sh/chart: {{ include "go-echoa96156b0-68a7-41c5-b5d8-9ed3a63498fa.chart" . }}
{{ include "go-echoa96156b0-68a7-41c5-b5d8-9ed3a63498fa.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa96156b0-68a7-41c5-b5d8-9ed3a63498fa.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa96156b0-68a7-41c5-b5d8-9ed3a63498fa.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}