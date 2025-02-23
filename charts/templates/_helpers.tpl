
{{- define "go-echoeb5dee8e-88c5-459a-9ae9-4719a2f92385.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoeb5dee8e-88c5-459a-9ae9-4719a2f92385.fullname" -}}
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


{{- define "go-echoeb5dee8e-88c5-459a-9ae9-4719a2f92385.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoeb5dee8e-88c5-459a-9ae9-4719a2f92385.labels" -}}
helm.sh/chart: {{ include "go-echoeb5dee8e-88c5-459a-9ae9-4719a2f92385.chart" . }}
{{ include "go-echoeb5dee8e-88c5-459a-9ae9-4719a2f92385.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoeb5dee8e-88c5-459a-9ae9-4719a2f92385.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoeb5dee8e-88c5-459a-9ae9-4719a2f92385.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}