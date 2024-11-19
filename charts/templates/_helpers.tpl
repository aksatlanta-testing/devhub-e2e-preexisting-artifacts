
{{- define "go-echo31113bd3-8560-422b-b4b1-5cec28ed8b48.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo31113bd3-8560-422b-b4b1-5cec28ed8b48.fullname" -}}
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


{{- define "go-echo31113bd3-8560-422b-b4b1-5cec28ed8b48.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo31113bd3-8560-422b-b4b1-5cec28ed8b48.labels" -}}
helm.sh/chart: {{ include "go-echo31113bd3-8560-422b-b4b1-5cec28ed8b48.chart" . }}
{{ include "go-echo31113bd3-8560-422b-b4b1-5cec28ed8b48.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo31113bd3-8560-422b-b4b1-5cec28ed8b48.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo31113bd3-8560-422b-b4b1-5cec28ed8b48.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}