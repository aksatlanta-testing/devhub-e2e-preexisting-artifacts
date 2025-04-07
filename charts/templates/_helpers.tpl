
{{- define "go-echoebd1f8ad-cc81-4c2c-9014-f2e4df8bb8ce.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoebd1f8ad-cc81-4c2c-9014-f2e4df8bb8ce.fullname" -}}
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


{{- define "go-echoebd1f8ad-cc81-4c2c-9014-f2e4df8bb8ce.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoebd1f8ad-cc81-4c2c-9014-f2e4df8bb8ce.labels" -}}
helm.sh/chart: {{ include "go-echoebd1f8ad-cc81-4c2c-9014-f2e4df8bb8ce.chart" . }}
{{ include "go-echoebd1f8ad-cc81-4c2c-9014-f2e4df8bb8ce.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoebd1f8ad-cc81-4c2c-9014-f2e4df8bb8ce.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoebd1f8ad-cc81-4c2c-9014-f2e4df8bb8ce.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}