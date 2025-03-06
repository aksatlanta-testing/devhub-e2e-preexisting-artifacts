
{{- define "go-echo83de1cf0-5009-42c6-ab0a-e10eab66ae5c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo83de1cf0-5009-42c6-ab0a-e10eab66ae5c.fullname" -}}
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


{{- define "go-echo83de1cf0-5009-42c6-ab0a-e10eab66ae5c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo83de1cf0-5009-42c6-ab0a-e10eab66ae5c.labels" -}}
helm.sh/chart: {{ include "go-echo83de1cf0-5009-42c6-ab0a-e10eab66ae5c.chart" . }}
{{ include "go-echo83de1cf0-5009-42c6-ab0a-e10eab66ae5c.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo83de1cf0-5009-42c6-ab0a-e10eab66ae5c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo83de1cf0-5009-42c6-ab0a-e10eab66ae5c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}