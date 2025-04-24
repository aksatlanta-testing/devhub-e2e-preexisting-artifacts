
{{- define "go-echoabb4d401-75b7-432d-a817-a15b65d849ce.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoabb4d401-75b7-432d-a817-a15b65d849ce.fullname" -}}
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


{{- define "go-echoabb4d401-75b7-432d-a817-a15b65d849ce.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoabb4d401-75b7-432d-a817-a15b65d849ce.labels" -}}
helm.sh/chart: {{ include "go-echoabb4d401-75b7-432d-a817-a15b65d849ce.chart" . }}
{{ include "go-echoabb4d401-75b7-432d-a817-a15b65d849ce.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoabb4d401-75b7-432d-a817-a15b65d849ce.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoabb4d401-75b7-432d-a817-a15b65d849ce.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}