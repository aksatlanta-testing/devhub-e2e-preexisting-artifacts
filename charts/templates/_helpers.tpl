
{{- define "go-echoead1af38-25de-48fc-b0dc-83d84614a2ca.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoead1af38-25de-48fc-b0dc-83d84614a2ca.fullname" -}}
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


{{- define "go-echoead1af38-25de-48fc-b0dc-83d84614a2ca.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoead1af38-25de-48fc-b0dc-83d84614a2ca.labels" -}}
helm.sh/chart: {{ include "go-echoead1af38-25de-48fc-b0dc-83d84614a2ca.chart" . }}
{{ include "go-echoead1af38-25de-48fc-b0dc-83d84614a2ca.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoead1af38-25de-48fc-b0dc-83d84614a2ca.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoead1af38-25de-48fc-b0dc-83d84614a2ca.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}