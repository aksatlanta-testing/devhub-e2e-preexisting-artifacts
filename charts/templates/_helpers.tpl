
{{- define "go-echo1d2695fb-954f-4aa0-8c7c-a80ee48bdcea.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo1d2695fb-954f-4aa0-8c7c-a80ee48bdcea.fullname" -}}
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


{{- define "go-echo1d2695fb-954f-4aa0-8c7c-a80ee48bdcea.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo1d2695fb-954f-4aa0-8c7c-a80ee48bdcea.labels" -}}
helm.sh/chart: {{ include "go-echo1d2695fb-954f-4aa0-8c7c-a80ee48bdcea.chart" . }}
{{ include "go-echo1d2695fb-954f-4aa0-8c7c-a80ee48bdcea.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo1d2695fb-954f-4aa0-8c7c-a80ee48bdcea.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo1d2695fb-954f-4aa0-8c7c-a80ee48bdcea.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}