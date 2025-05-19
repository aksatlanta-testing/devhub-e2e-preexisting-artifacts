
{{- define "go-echoa9ea2c3c-52b3-4f53-9c13-0dfc0cfb8963.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa9ea2c3c-52b3-4f53-9c13-0dfc0cfb8963.fullname" -}}
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


{{- define "go-echoa9ea2c3c-52b3-4f53-9c13-0dfc0cfb8963.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa9ea2c3c-52b3-4f53-9c13-0dfc0cfb8963.labels" -}}
helm.sh/chart: {{ include "go-echoa9ea2c3c-52b3-4f53-9c13-0dfc0cfb8963.chart" . }}
{{ include "go-echoa9ea2c3c-52b3-4f53-9c13-0dfc0cfb8963.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa9ea2c3c-52b3-4f53-9c13-0dfc0cfb8963.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa9ea2c3c-52b3-4f53-9c13-0dfc0cfb8963.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}