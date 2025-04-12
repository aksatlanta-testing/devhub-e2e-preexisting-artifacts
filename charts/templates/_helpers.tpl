
{{- define "go-echo213753ad-71de-43e9-aee6-ab362c2ce8dd.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo213753ad-71de-43e9-aee6-ab362c2ce8dd.fullname" -}}
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


{{- define "go-echo213753ad-71de-43e9-aee6-ab362c2ce8dd.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo213753ad-71de-43e9-aee6-ab362c2ce8dd.labels" -}}
helm.sh/chart: {{ include "go-echo213753ad-71de-43e9-aee6-ab362c2ce8dd.chart" . }}
{{ include "go-echo213753ad-71de-43e9-aee6-ab362c2ce8dd.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo213753ad-71de-43e9-aee6-ab362c2ce8dd.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo213753ad-71de-43e9-aee6-ab362c2ce8dd.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}