
{{- define "go-echoab0dd8f0-ea5e-4319-9e9d-625702e2f167.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoab0dd8f0-ea5e-4319-9e9d-625702e2f167.fullname" -}}
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


{{- define "go-echoab0dd8f0-ea5e-4319-9e9d-625702e2f167.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoab0dd8f0-ea5e-4319-9e9d-625702e2f167.labels" -}}
helm.sh/chart: {{ include "go-echoab0dd8f0-ea5e-4319-9e9d-625702e2f167.chart" . }}
{{ include "go-echoab0dd8f0-ea5e-4319-9e9d-625702e2f167.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoab0dd8f0-ea5e-4319-9e9d-625702e2f167.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoab0dd8f0-ea5e-4319-9e9d-625702e2f167.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}