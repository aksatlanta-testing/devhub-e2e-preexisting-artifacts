
{{- define "go-echo526d15f9-21ac-42c0-bac5-e6ceb2ce07ed.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo526d15f9-21ac-42c0-bac5-e6ceb2ce07ed.fullname" -}}
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


{{- define "go-echo526d15f9-21ac-42c0-bac5-e6ceb2ce07ed.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo526d15f9-21ac-42c0-bac5-e6ceb2ce07ed.labels" -}}
helm.sh/chart: {{ include "go-echo526d15f9-21ac-42c0-bac5-e6ceb2ce07ed.chart" . }}
{{ include "go-echo526d15f9-21ac-42c0-bac5-e6ceb2ce07ed.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo526d15f9-21ac-42c0-bac5-e6ceb2ce07ed.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo526d15f9-21ac-42c0-bac5-e6ceb2ce07ed.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}