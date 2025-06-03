
{{- define "go-echo848d9e55-591e-48fa-9ea7-82b552a262ce.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo848d9e55-591e-48fa-9ea7-82b552a262ce.fullname" -}}
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


{{- define "go-echo848d9e55-591e-48fa-9ea7-82b552a262ce.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo848d9e55-591e-48fa-9ea7-82b552a262ce.labels" -}}
helm.sh/chart: {{ include "go-echo848d9e55-591e-48fa-9ea7-82b552a262ce.chart" . }}
{{ include "go-echo848d9e55-591e-48fa-9ea7-82b552a262ce.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo848d9e55-591e-48fa-9ea7-82b552a262ce.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo848d9e55-591e-48fa-9ea7-82b552a262ce.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}