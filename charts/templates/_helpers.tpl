
{{- define "go-echoe55679a7-b62a-4c7e-bf8f-18a51b99ab56.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe55679a7-b62a-4c7e-bf8f-18a51b99ab56.fullname" -}}
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


{{- define "go-echoe55679a7-b62a-4c7e-bf8f-18a51b99ab56.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe55679a7-b62a-4c7e-bf8f-18a51b99ab56.labels" -}}
helm.sh/chart: {{ include "go-echoe55679a7-b62a-4c7e-bf8f-18a51b99ab56.chart" . }}
{{ include "go-echoe55679a7-b62a-4c7e-bf8f-18a51b99ab56.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoe55679a7-b62a-4c7e-bf8f-18a51b99ab56.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoe55679a7-b62a-4c7e-bf8f-18a51b99ab56.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}