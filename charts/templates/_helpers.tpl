
{{- define "go-echocb833bea-a30e-44ed-aaa2-9398e19e0fff.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocb833bea-a30e-44ed-aaa2-9398e19e0fff.fullname" -}}
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


{{- define "go-echocb833bea-a30e-44ed-aaa2-9398e19e0fff.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocb833bea-a30e-44ed-aaa2-9398e19e0fff.labels" -}}
helm.sh/chart: {{ include "go-echocb833bea-a30e-44ed-aaa2-9398e19e0fff.chart" . }}
{{ include "go-echocb833bea-a30e-44ed-aaa2-9398e19e0fff.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echocb833bea-a30e-44ed-aaa2-9398e19e0fff.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echocb833bea-a30e-44ed-aaa2-9398e19e0fff.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}