
{{- define "go-echo1d7eaf1f-93b5-43b4-94ba-b41e33cd022d.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo1d7eaf1f-93b5-43b4-94ba-b41e33cd022d.fullname" -}}
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


{{- define "go-echo1d7eaf1f-93b5-43b4-94ba-b41e33cd022d.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo1d7eaf1f-93b5-43b4-94ba-b41e33cd022d.labels" -}}
helm.sh/chart: {{ include "go-echo1d7eaf1f-93b5-43b4-94ba-b41e33cd022d.chart" . }}
{{ include "go-echo1d7eaf1f-93b5-43b4-94ba-b41e33cd022d.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo1d7eaf1f-93b5-43b4-94ba-b41e33cd022d.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo1d7eaf1f-93b5-43b4-94ba-b41e33cd022d.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}