
{{- define "go-echod95d3b7a-30fc-46f1-9306-c15f26ad1762.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod95d3b7a-30fc-46f1-9306-c15f26ad1762.fullname" -}}
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


{{- define "go-echod95d3b7a-30fc-46f1-9306-c15f26ad1762.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod95d3b7a-30fc-46f1-9306-c15f26ad1762.labels" -}}
helm.sh/chart: {{ include "go-echod95d3b7a-30fc-46f1-9306-c15f26ad1762.chart" . }}
{{ include "go-echod95d3b7a-30fc-46f1-9306-c15f26ad1762.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod95d3b7a-30fc-46f1-9306-c15f26ad1762.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod95d3b7a-30fc-46f1-9306-c15f26ad1762.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}