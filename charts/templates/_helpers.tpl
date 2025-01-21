
{{- define "go-echo2c464e98-7223-4462-b012-a8c7e5535ccf.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo2c464e98-7223-4462-b012-a8c7e5535ccf.fullname" -}}
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


{{- define "go-echo2c464e98-7223-4462-b012-a8c7e5535ccf.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo2c464e98-7223-4462-b012-a8c7e5535ccf.labels" -}}
helm.sh/chart: {{ include "go-echo2c464e98-7223-4462-b012-a8c7e5535ccf.chart" . }}
{{ include "go-echo2c464e98-7223-4462-b012-a8c7e5535ccf.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo2c464e98-7223-4462-b012-a8c7e5535ccf.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo2c464e98-7223-4462-b012-a8c7e5535ccf.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}