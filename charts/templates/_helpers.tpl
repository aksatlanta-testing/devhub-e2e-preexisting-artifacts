
{{- define "go-echof827e670-4396-4078-a413-04a4ecec8ee1.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof827e670-4396-4078-a413-04a4ecec8ee1.fullname" -}}
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


{{- define "go-echof827e670-4396-4078-a413-04a4ecec8ee1.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof827e670-4396-4078-a413-04a4ecec8ee1.labels" -}}
helm.sh/chart: {{ include "go-echof827e670-4396-4078-a413-04a4ecec8ee1.chart" . }}
{{ include "go-echof827e670-4396-4078-a413-04a4ecec8ee1.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof827e670-4396-4078-a413-04a4ecec8ee1.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof827e670-4396-4078-a413-04a4ecec8ee1.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}