
{{- define "go-echoeba78a8f-80c6-47d3-bb6d-601783bb3506.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoeba78a8f-80c6-47d3-bb6d-601783bb3506.fullname" -}}
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


{{- define "go-echoeba78a8f-80c6-47d3-bb6d-601783bb3506.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoeba78a8f-80c6-47d3-bb6d-601783bb3506.labels" -}}
helm.sh/chart: {{ include "go-echoeba78a8f-80c6-47d3-bb6d-601783bb3506.chart" . }}
{{ include "go-echoeba78a8f-80c6-47d3-bb6d-601783bb3506.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoeba78a8f-80c6-47d3-bb6d-601783bb3506.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoeba78a8f-80c6-47d3-bb6d-601783bb3506.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}