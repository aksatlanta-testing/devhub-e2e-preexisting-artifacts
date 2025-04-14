
{{- define "go-echobcf7f7ea-63a6-41d1-bed8-84aafe81c69b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobcf7f7ea-63a6-41d1-bed8-84aafe81c69b.fullname" -}}
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


{{- define "go-echobcf7f7ea-63a6-41d1-bed8-84aafe81c69b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobcf7f7ea-63a6-41d1-bed8-84aafe81c69b.labels" -}}
helm.sh/chart: {{ include "go-echobcf7f7ea-63a6-41d1-bed8-84aafe81c69b.chart" . }}
{{ include "go-echobcf7f7ea-63a6-41d1-bed8-84aafe81c69b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echobcf7f7ea-63a6-41d1-bed8-84aafe81c69b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echobcf7f7ea-63a6-41d1-bed8-84aafe81c69b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}