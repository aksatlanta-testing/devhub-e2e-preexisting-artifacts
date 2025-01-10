
{{- define "go-echoda3d7bef-aa4d-473f-99a2-7523f39a0357.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoda3d7bef-aa4d-473f-99a2-7523f39a0357.fullname" -}}
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


{{- define "go-echoda3d7bef-aa4d-473f-99a2-7523f39a0357.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoda3d7bef-aa4d-473f-99a2-7523f39a0357.labels" -}}
helm.sh/chart: {{ include "go-echoda3d7bef-aa4d-473f-99a2-7523f39a0357.chart" . }}
{{ include "go-echoda3d7bef-aa4d-473f-99a2-7523f39a0357.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoda3d7bef-aa4d-473f-99a2-7523f39a0357.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoda3d7bef-aa4d-473f-99a2-7523f39a0357.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}