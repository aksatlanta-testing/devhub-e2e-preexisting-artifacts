
{{- define "go-echofb897953-d1a7-422b-ada2-7f8be230df83.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofb897953-d1a7-422b-ada2-7f8be230df83.fullname" -}}
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


{{- define "go-echofb897953-d1a7-422b-ada2-7f8be230df83.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofb897953-d1a7-422b-ada2-7f8be230df83.labels" -}}
helm.sh/chart: {{ include "go-echofb897953-d1a7-422b-ada2-7f8be230df83.chart" . }}
{{ include "go-echofb897953-d1a7-422b-ada2-7f8be230df83.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echofb897953-d1a7-422b-ada2-7f8be230df83.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echofb897953-d1a7-422b-ada2-7f8be230df83.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}