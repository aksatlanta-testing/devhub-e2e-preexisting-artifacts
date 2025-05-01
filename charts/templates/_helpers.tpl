
{{- define "go-echoaad088ec-9c90-4d70-807d-2ffb3ba6a0e6.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoaad088ec-9c90-4d70-807d-2ffb3ba6a0e6.fullname" -}}
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


{{- define "go-echoaad088ec-9c90-4d70-807d-2ffb3ba6a0e6.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoaad088ec-9c90-4d70-807d-2ffb3ba6a0e6.labels" -}}
helm.sh/chart: {{ include "go-echoaad088ec-9c90-4d70-807d-2ffb3ba6a0e6.chart" . }}
{{ include "go-echoaad088ec-9c90-4d70-807d-2ffb3ba6a0e6.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoaad088ec-9c90-4d70-807d-2ffb3ba6a0e6.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoaad088ec-9c90-4d70-807d-2ffb3ba6a0e6.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}