
{{- define "go-echoea5dc4b2-4fa8-444e-9bfa-69dc010908dd.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoea5dc4b2-4fa8-444e-9bfa-69dc010908dd.fullname" -}}
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


{{- define "go-echoea5dc4b2-4fa8-444e-9bfa-69dc010908dd.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoea5dc4b2-4fa8-444e-9bfa-69dc010908dd.labels" -}}
helm.sh/chart: {{ include "go-echoea5dc4b2-4fa8-444e-9bfa-69dc010908dd.chart" . }}
{{ include "go-echoea5dc4b2-4fa8-444e-9bfa-69dc010908dd.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoea5dc4b2-4fa8-444e-9bfa-69dc010908dd.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoea5dc4b2-4fa8-444e-9bfa-69dc010908dd.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}