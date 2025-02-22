
{{- define "go-echo602fd3b2-1acf-4bde-aa1a-c547062ce039.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo602fd3b2-1acf-4bde-aa1a-c547062ce039.fullname" -}}
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


{{- define "go-echo602fd3b2-1acf-4bde-aa1a-c547062ce039.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo602fd3b2-1acf-4bde-aa1a-c547062ce039.labels" -}}
helm.sh/chart: {{ include "go-echo602fd3b2-1acf-4bde-aa1a-c547062ce039.chart" . }}
{{ include "go-echo602fd3b2-1acf-4bde-aa1a-c547062ce039.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo602fd3b2-1acf-4bde-aa1a-c547062ce039.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo602fd3b2-1acf-4bde-aa1a-c547062ce039.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}