
{{- define "go-echob7d1a2c9-2761-4b3a-8292-3ffdb7eea447.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob7d1a2c9-2761-4b3a-8292-3ffdb7eea447.fullname" -}}
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


{{- define "go-echob7d1a2c9-2761-4b3a-8292-3ffdb7eea447.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob7d1a2c9-2761-4b3a-8292-3ffdb7eea447.labels" -}}
helm.sh/chart: {{ include "go-echob7d1a2c9-2761-4b3a-8292-3ffdb7eea447.chart" . }}
{{ include "go-echob7d1a2c9-2761-4b3a-8292-3ffdb7eea447.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echob7d1a2c9-2761-4b3a-8292-3ffdb7eea447.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echob7d1a2c9-2761-4b3a-8292-3ffdb7eea447.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}