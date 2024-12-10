
{{- define "go-echo2c624628-c8ad-4cf5-8df8-ee553a15b264.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo2c624628-c8ad-4cf5-8df8-ee553a15b264.fullname" -}}
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


{{- define "go-echo2c624628-c8ad-4cf5-8df8-ee553a15b264.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo2c624628-c8ad-4cf5-8df8-ee553a15b264.labels" -}}
helm.sh/chart: {{ include "go-echo2c624628-c8ad-4cf5-8df8-ee553a15b264.chart" . }}
{{ include "go-echo2c624628-c8ad-4cf5-8df8-ee553a15b264.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo2c624628-c8ad-4cf5-8df8-ee553a15b264.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo2c624628-c8ad-4cf5-8df8-ee553a15b264.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}