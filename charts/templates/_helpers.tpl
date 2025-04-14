
{{- define "go-echoab1be9b2-9dbb-4184-8af1-8b143ac7f32f.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoab1be9b2-9dbb-4184-8af1-8b143ac7f32f.fullname" -}}
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


{{- define "go-echoab1be9b2-9dbb-4184-8af1-8b143ac7f32f.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoab1be9b2-9dbb-4184-8af1-8b143ac7f32f.labels" -}}
helm.sh/chart: {{ include "go-echoab1be9b2-9dbb-4184-8af1-8b143ac7f32f.chart" . }}
{{ include "go-echoab1be9b2-9dbb-4184-8af1-8b143ac7f32f.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoab1be9b2-9dbb-4184-8af1-8b143ac7f32f.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoab1be9b2-9dbb-4184-8af1-8b143ac7f32f.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}