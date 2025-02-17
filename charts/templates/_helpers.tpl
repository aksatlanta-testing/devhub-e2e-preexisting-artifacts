
{{- define "go-echo53096e33-1994-48f6-af0c-101f64f56bbd.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo53096e33-1994-48f6-af0c-101f64f56bbd.fullname" -}}
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


{{- define "go-echo53096e33-1994-48f6-af0c-101f64f56bbd.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo53096e33-1994-48f6-af0c-101f64f56bbd.labels" -}}
helm.sh/chart: {{ include "go-echo53096e33-1994-48f6-af0c-101f64f56bbd.chart" . }}
{{ include "go-echo53096e33-1994-48f6-af0c-101f64f56bbd.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo53096e33-1994-48f6-af0c-101f64f56bbd.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo53096e33-1994-48f6-af0c-101f64f56bbd.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}