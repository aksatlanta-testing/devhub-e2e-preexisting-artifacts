
{{- define "go-echo7cf54cc7-a2e1-4de6-901b-86eb55a20fcf.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo7cf54cc7-a2e1-4de6-901b-86eb55a20fcf.fullname" -}}
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


{{- define "go-echo7cf54cc7-a2e1-4de6-901b-86eb55a20fcf.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo7cf54cc7-a2e1-4de6-901b-86eb55a20fcf.labels" -}}
helm.sh/chart: {{ include "go-echo7cf54cc7-a2e1-4de6-901b-86eb55a20fcf.chart" . }}
{{ include "go-echo7cf54cc7-a2e1-4de6-901b-86eb55a20fcf.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo7cf54cc7-a2e1-4de6-901b-86eb55a20fcf.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo7cf54cc7-a2e1-4de6-901b-86eb55a20fcf.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}