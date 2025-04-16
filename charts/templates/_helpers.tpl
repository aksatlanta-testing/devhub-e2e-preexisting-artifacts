
{{- define "go-echoffdbc8e4-885f-46ef-864b-80be54a48380.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoffdbc8e4-885f-46ef-864b-80be54a48380.fullname" -}}
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


{{- define "go-echoffdbc8e4-885f-46ef-864b-80be54a48380.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoffdbc8e4-885f-46ef-864b-80be54a48380.labels" -}}
helm.sh/chart: {{ include "go-echoffdbc8e4-885f-46ef-864b-80be54a48380.chart" . }}
{{ include "go-echoffdbc8e4-885f-46ef-864b-80be54a48380.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoffdbc8e4-885f-46ef-864b-80be54a48380.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoffdbc8e4-885f-46ef-864b-80be54a48380.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}