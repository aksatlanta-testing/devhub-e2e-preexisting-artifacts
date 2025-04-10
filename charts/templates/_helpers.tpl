
{{- define "go-echoedd22295-68fe-4c7e-a9cc-ea6644a61127.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoedd22295-68fe-4c7e-a9cc-ea6644a61127.fullname" -}}
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


{{- define "go-echoedd22295-68fe-4c7e-a9cc-ea6644a61127.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoedd22295-68fe-4c7e-a9cc-ea6644a61127.labels" -}}
helm.sh/chart: {{ include "go-echoedd22295-68fe-4c7e-a9cc-ea6644a61127.chart" . }}
{{ include "go-echoedd22295-68fe-4c7e-a9cc-ea6644a61127.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoedd22295-68fe-4c7e-a9cc-ea6644a61127.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoedd22295-68fe-4c7e-a9cc-ea6644a61127.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}