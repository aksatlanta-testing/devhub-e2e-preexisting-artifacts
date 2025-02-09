
{{- define "go-echo5ad8eac3-7791-4cac-b2d4-b58a5a8f7fce.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo5ad8eac3-7791-4cac-b2d4-b58a5a8f7fce.fullname" -}}
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


{{- define "go-echo5ad8eac3-7791-4cac-b2d4-b58a5a8f7fce.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo5ad8eac3-7791-4cac-b2d4-b58a5a8f7fce.labels" -}}
helm.sh/chart: {{ include "go-echo5ad8eac3-7791-4cac-b2d4-b58a5a8f7fce.chart" . }}
{{ include "go-echo5ad8eac3-7791-4cac-b2d4-b58a5a8f7fce.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo5ad8eac3-7791-4cac-b2d4-b58a5a8f7fce.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo5ad8eac3-7791-4cac-b2d4-b58a5a8f7fce.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}