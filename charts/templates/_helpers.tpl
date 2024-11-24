
{{- define "go-echof1b7e94f-20e8-40fe-b346-3ac9f3d5ca20.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof1b7e94f-20e8-40fe-b346-3ac9f3d5ca20.fullname" -}}
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


{{- define "go-echof1b7e94f-20e8-40fe-b346-3ac9f3d5ca20.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof1b7e94f-20e8-40fe-b346-3ac9f3d5ca20.labels" -}}
helm.sh/chart: {{ include "go-echof1b7e94f-20e8-40fe-b346-3ac9f3d5ca20.chart" . }}
{{ include "go-echof1b7e94f-20e8-40fe-b346-3ac9f3d5ca20.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof1b7e94f-20e8-40fe-b346-3ac9f3d5ca20.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof1b7e94f-20e8-40fe-b346-3ac9f3d5ca20.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}