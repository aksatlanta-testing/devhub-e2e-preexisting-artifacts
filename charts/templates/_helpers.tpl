
{{- define "go-echo9114c52a-4b44-46f8-8d61-40e1bcc0210c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo9114c52a-4b44-46f8-8d61-40e1bcc0210c.fullname" -}}
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


{{- define "go-echo9114c52a-4b44-46f8-8d61-40e1bcc0210c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo9114c52a-4b44-46f8-8d61-40e1bcc0210c.labels" -}}
helm.sh/chart: {{ include "go-echo9114c52a-4b44-46f8-8d61-40e1bcc0210c.chart" . }}
{{ include "go-echo9114c52a-4b44-46f8-8d61-40e1bcc0210c.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo9114c52a-4b44-46f8-8d61-40e1bcc0210c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo9114c52a-4b44-46f8-8d61-40e1bcc0210c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}