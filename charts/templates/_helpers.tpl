
{{- define "go-echob1771ce2-a130-41f4-bcc2-12d9e2d36b13.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob1771ce2-a130-41f4-bcc2-12d9e2d36b13.fullname" -}}
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


{{- define "go-echob1771ce2-a130-41f4-bcc2-12d9e2d36b13.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob1771ce2-a130-41f4-bcc2-12d9e2d36b13.labels" -}}
helm.sh/chart: {{ include "go-echob1771ce2-a130-41f4-bcc2-12d9e2d36b13.chart" . }}
{{ include "go-echob1771ce2-a130-41f4-bcc2-12d9e2d36b13.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echob1771ce2-a130-41f4-bcc2-12d9e2d36b13.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echob1771ce2-a130-41f4-bcc2-12d9e2d36b13.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}