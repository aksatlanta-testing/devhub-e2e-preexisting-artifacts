
{{- define "go-echod95d5e5a-34b9-42f3-aeed-f09f9f998acd.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod95d5e5a-34b9-42f3-aeed-f09f9f998acd.fullname" -}}
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


{{- define "go-echod95d5e5a-34b9-42f3-aeed-f09f9f998acd.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod95d5e5a-34b9-42f3-aeed-f09f9f998acd.labels" -}}
helm.sh/chart: {{ include "go-echod95d5e5a-34b9-42f3-aeed-f09f9f998acd.chart" . }}
{{ include "go-echod95d5e5a-34b9-42f3-aeed-f09f9f998acd.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod95d5e5a-34b9-42f3-aeed-f09f9f998acd.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod95d5e5a-34b9-42f3-aeed-f09f9f998acd.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}