
{{- define "go-echobac33cac-1b16-473d-baf3-00cf3505c5f2.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobac33cac-1b16-473d-baf3-00cf3505c5f2.fullname" -}}
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


{{- define "go-echobac33cac-1b16-473d-baf3-00cf3505c5f2.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobac33cac-1b16-473d-baf3-00cf3505c5f2.labels" -}}
helm.sh/chart: {{ include "go-echobac33cac-1b16-473d-baf3-00cf3505c5f2.chart" . }}
{{ include "go-echobac33cac-1b16-473d-baf3-00cf3505c5f2.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echobac33cac-1b16-473d-baf3-00cf3505c5f2.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echobac33cac-1b16-473d-baf3-00cf3505c5f2.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}