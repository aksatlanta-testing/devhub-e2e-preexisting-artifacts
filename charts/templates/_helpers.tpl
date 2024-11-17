
{{- define "go-echof1611f49-a795-4f4c-a01d-d61af291010e.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof1611f49-a795-4f4c-a01d-d61af291010e.fullname" -}}
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


{{- define "go-echof1611f49-a795-4f4c-a01d-d61af291010e.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof1611f49-a795-4f4c-a01d-d61af291010e.labels" -}}
helm.sh/chart: {{ include "go-echof1611f49-a795-4f4c-a01d-d61af291010e.chart" . }}
{{ include "go-echof1611f49-a795-4f4c-a01d-d61af291010e.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof1611f49-a795-4f4c-a01d-d61af291010e.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof1611f49-a795-4f4c-a01d-d61af291010e.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}