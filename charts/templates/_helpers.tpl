
{{- define "go-echo830067f2-f355-4584-90e4-0594ac22fc0c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo830067f2-f355-4584-90e4-0594ac22fc0c.fullname" -}}
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


{{- define "go-echo830067f2-f355-4584-90e4-0594ac22fc0c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo830067f2-f355-4584-90e4-0594ac22fc0c.labels" -}}
helm.sh/chart: {{ include "go-echo830067f2-f355-4584-90e4-0594ac22fc0c.chart" . }}
{{ include "go-echo830067f2-f355-4584-90e4-0594ac22fc0c.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo830067f2-f355-4584-90e4-0594ac22fc0c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo830067f2-f355-4584-90e4-0594ac22fc0c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}