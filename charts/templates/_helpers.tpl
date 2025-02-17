
{{- define "go-echo8cf97168-c6c0-405e-8f3a-1092625c53fc.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo8cf97168-c6c0-405e-8f3a-1092625c53fc.fullname" -}}
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


{{- define "go-echo8cf97168-c6c0-405e-8f3a-1092625c53fc.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo8cf97168-c6c0-405e-8f3a-1092625c53fc.labels" -}}
helm.sh/chart: {{ include "go-echo8cf97168-c6c0-405e-8f3a-1092625c53fc.chart" . }}
{{ include "go-echo8cf97168-c6c0-405e-8f3a-1092625c53fc.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo8cf97168-c6c0-405e-8f3a-1092625c53fc.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo8cf97168-c6c0-405e-8f3a-1092625c53fc.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}