
{{- define "go-echo1d815f1a-4f5a-4c0e-a670-8ea8d79b17bd.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo1d815f1a-4f5a-4c0e-a670-8ea8d79b17bd.fullname" -}}
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


{{- define "go-echo1d815f1a-4f5a-4c0e-a670-8ea8d79b17bd.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo1d815f1a-4f5a-4c0e-a670-8ea8d79b17bd.labels" -}}
helm.sh/chart: {{ include "go-echo1d815f1a-4f5a-4c0e-a670-8ea8d79b17bd.chart" . }}
{{ include "go-echo1d815f1a-4f5a-4c0e-a670-8ea8d79b17bd.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo1d815f1a-4f5a-4c0e-a670-8ea8d79b17bd.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo1d815f1a-4f5a-4c0e-a670-8ea8d79b17bd.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}