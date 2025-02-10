
{{- define "go-echocd86f909-c5a2-4990-875b-7b2b5a6f1768.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocd86f909-c5a2-4990-875b-7b2b5a6f1768.fullname" -}}
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


{{- define "go-echocd86f909-c5a2-4990-875b-7b2b5a6f1768.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocd86f909-c5a2-4990-875b-7b2b5a6f1768.labels" -}}
helm.sh/chart: {{ include "go-echocd86f909-c5a2-4990-875b-7b2b5a6f1768.chart" . }}
{{ include "go-echocd86f909-c5a2-4990-875b-7b2b5a6f1768.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echocd86f909-c5a2-4990-875b-7b2b5a6f1768.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echocd86f909-c5a2-4990-875b-7b2b5a6f1768.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}