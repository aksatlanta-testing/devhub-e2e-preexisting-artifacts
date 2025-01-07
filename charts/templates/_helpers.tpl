
{{- define "go-echoac2585a5-ff04-4f8e-8e90-185414d755f6.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoac2585a5-ff04-4f8e-8e90-185414d755f6.fullname" -}}
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


{{- define "go-echoac2585a5-ff04-4f8e-8e90-185414d755f6.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoac2585a5-ff04-4f8e-8e90-185414d755f6.labels" -}}
helm.sh/chart: {{ include "go-echoac2585a5-ff04-4f8e-8e90-185414d755f6.chart" . }}
{{ include "go-echoac2585a5-ff04-4f8e-8e90-185414d755f6.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoac2585a5-ff04-4f8e-8e90-185414d755f6.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoac2585a5-ff04-4f8e-8e90-185414d755f6.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}