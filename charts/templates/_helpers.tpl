
{{- define "go-echoacdebfb3-6225-44f7-a964-a972b64706cb.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoacdebfb3-6225-44f7-a964-a972b64706cb.fullname" -}}
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


{{- define "go-echoacdebfb3-6225-44f7-a964-a972b64706cb.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoacdebfb3-6225-44f7-a964-a972b64706cb.labels" -}}
helm.sh/chart: {{ include "go-echoacdebfb3-6225-44f7-a964-a972b64706cb.chart" . }}
{{ include "go-echoacdebfb3-6225-44f7-a964-a972b64706cb.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoacdebfb3-6225-44f7-a964-a972b64706cb.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoacdebfb3-6225-44f7-a964-a972b64706cb.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}