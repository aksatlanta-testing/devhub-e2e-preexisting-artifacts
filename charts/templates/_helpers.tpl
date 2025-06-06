
{{- define "go-echo8d9b25e0-9be0-4c6f-b839-696d781f56bc.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo8d9b25e0-9be0-4c6f-b839-696d781f56bc.fullname" -}}
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


{{- define "go-echo8d9b25e0-9be0-4c6f-b839-696d781f56bc.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo8d9b25e0-9be0-4c6f-b839-696d781f56bc.labels" -}}
helm.sh/chart: {{ include "go-echo8d9b25e0-9be0-4c6f-b839-696d781f56bc.chart" . }}
{{ include "go-echo8d9b25e0-9be0-4c6f-b839-696d781f56bc.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo8d9b25e0-9be0-4c6f-b839-696d781f56bc.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo8d9b25e0-9be0-4c6f-b839-696d781f56bc.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}