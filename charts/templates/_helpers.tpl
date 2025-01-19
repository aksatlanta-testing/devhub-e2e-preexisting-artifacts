
{{- define "go-echo2d7f8842-81f9-4992-ae8f-136e778d7cbd.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo2d7f8842-81f9-4992-ae8f-136e778d7cbd.fullname" -}}
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


{{- define "go-echo2d7f8842-81f9-4992-ae8f-136e778d7cbd.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo2d7f8842-81f9-4992-ae8f-136e778d7cbd.labels" -}}
helm.sh/chart: {{ include "go-echo2d7f8842-81f9-4992-ae8f-136e778d7cbd.chart" . }}
{{ include "go-echo2d7f8842-81f9-4992-ae8f-136e778d7cbd.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo2d7f8842-81f9-4992-ae8f-136e778d7cbd.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo2d7f8842-81f9-4992-ae8f-136e778d7cbd.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}