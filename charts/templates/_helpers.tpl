
{{- define "go-echoa6ccc8cf-4018-4323-bcc9-79e170f4b190.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa6ccc8cf-4018-4323-bcc9-79e170f4b190.fullname" -}}
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


{{- define "go-echoa6ccc8cf-4018-4323-bcc9-79e170f4b190.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa6ccc8cf-4018-4323-bcc9-79e170f4b190.labels" -}}
helm.sh/chart: {{ include "go-echoa6ccc8cf-4018-4323-bcc9-79e170f4b190.chart" . }}
{{ include "go-echoa6ccc8cf-4018-4323-bcc9-79e170f4b190.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa6ccc8cf-4018-4323-bcc9-79e170f4b190.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa6ccc8cf-4018-4323-bcc9-79e170f4b190.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}