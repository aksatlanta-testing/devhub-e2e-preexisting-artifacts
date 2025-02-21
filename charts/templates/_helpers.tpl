
{{- define "go-echoc2a848a5-ae52-4a0f-a5d3-cc7cece3298f.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc2a848a5-ae52-4a0f-a5d3-cc7cece3298f.fullname" -}}
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


{{- define "go-echoc2a848a5-ae52-4a0f-a5d3-cc7cece3298f.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc2a848a5-ae52-4a0f-a5d3-cc7cece3298f.labels" -}}
helm.sh/chart: {{ include "go-echoc2a848a5-ae52-4a0f-a5d3-cc7cece3298f.chart" . }}
{{ include "go-echoc2a848a5-ae52-4a0f-a5d3-cc7cece3298f.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoc2a848a5-ae52-4a0f-a5d3-cc7cece3298f.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoc2a848a5-ae52-4a0f-a5d3-cc7cece3298f.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}