
{{- define "go-echocb0a04b2-eee4-46d4-b4ea-a232f161675d.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocb0a04b2-eee4-46d4-b4ea-a232f161675d.fullname" -}}
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


{{- define "go-echocb0a04b2-eee4-46d4-b4ea-a232f161675d.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocb0a04b2-eee4-46d4-b4ea-a232f161675d.labels" -}}
helm.sh/chart: {{ include "go-echocb0a04b2-eee4-46d4-b4ea-a232f161675d.chart" . }}
{{ include "go-echocb0a04b2-eee4-46d4-b4ea-a232f161675d.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echocb0a04b2-eee4-46d4-b4ea-a232f161675d.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echocb0a04b2-eee4-46d4-b4ea-a232f161675d.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}