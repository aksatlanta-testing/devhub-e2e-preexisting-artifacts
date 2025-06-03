
{{- define "go-echo098521ff-052f-41a7-ba5f-f9778ecd2f3b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo098521ff-052f-41a7-ba5f-f9778ecd2f3b.fullname" -}}
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


{{- define "go-echo098521ff-052f-41a7-ba5f-f9778ecd2f3b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo098521ff-052f-41a7-ba5f-f9778ecd2f3b.labels" -}}
helm.sh/chart: {{ include "go-echo098521ff-052f-41a7-ba5f-f9778ecd2f3b.chart" . }}
{{ include "go-echo098521ff-052f-41a7-ba5f-f9778ecd2f3b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo098521ff-052f-41a7-ba5f-f9778ecd2f3b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo098521ff-052f-41a7-ba5f-f9778ecd2f3b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}