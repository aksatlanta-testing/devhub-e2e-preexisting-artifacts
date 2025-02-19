
{{- define "go-echo87f25e16-c347-4808-a97c-bbdccd6e09ee.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo87f25e16-c347-4808-a97c-bbdccd6e09ee.fullname" -}}
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


{{- define "go-echo87f25e16-c347-4808-a97c-bbdccd6e09ee.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo87f25e16-c347-4808-a97c-bbdccd6e09ee.labels" -}}
helm.sh/chart: {{ include "go-echo87f25e16-c347-4808-a97c-bbdccd6e09ee.chart" . }}
{{ include "go-echo87f25e16-c347-4808-a97c-bbdccd6e09ee.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo87f25e16-c347-4808-a97c-bbdccd6e09ee.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo87f25e16-c347-4808-a97c-bbdccd6e09ee.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}