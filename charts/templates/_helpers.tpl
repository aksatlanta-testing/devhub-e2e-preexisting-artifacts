
{{- define "go-echo1e0defa4-71c8-4ed9-94fb-596fee9abd2b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo1e0defa4-71c8-4ed9-94fb-596fee9abd2b.fullname" -}}
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


{{- define "go-echo1e0defa4-71c8-4ed9-94fb-596fee9abd2b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo1e0defa4-71c8-4ed9-94fb-596fee9abd2b.labels" -}}
helm.sh/chart: {{ include "go-echo1e0defa4-71c8-4ed9-94fb-596fee9abd2b.chart" . }}
{{ include "go-echo1e0defa4-71c8-4ed9-94fb-596fee9abd2b.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo1e0defa4-71c8-4ed9-94fb-596fee9abd2b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo1e0defa4-71c8-4ed9-94fb-596fee9abd2b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}