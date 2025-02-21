
{{- define "go-echoed5431f2-1a70-4348-b77a-7c0b9eefbfaa.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoed5431f2-1a70-4348-b77a-7c0b9eefbfaa.fullname" -}}
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


{{- define "go-echoed5431f2-1a70-4348-b77a-7c0b9eefbfaa.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoed5431f2-1a70-4348-b77a-7c0b9eefbfaa.labels" -}}
helm.sh/chart: {{ include "go-echoed5431f2-1a70-4348-b77a-7c0b9eefbfaa.chart" . }}
{{ include "go-echoed5431f2-1a70-4348-b77a-7c0b9eefbfaa.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoed5431f2-1a70-4348-b77a-7c0b9eefbfaa.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoed5431f2-1a70-4348-b77a-7c0b9eefbfaa.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}