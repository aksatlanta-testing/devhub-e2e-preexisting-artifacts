
{{- define "go-echo7c8d5eea-7b6f-406c-9545-468014df990f.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo7c8d5eea-7b6f-406c-9545-468014df990f.fullname" -}}
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


{{- define "go-echo7c8d5eea-7b6f-406c-9545-468014df990f.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo7c8d5eea-7b6f-406c-9545-468014df990f.labels" -}}
helm.sh/chart: {{ include "go-echo7c8d5eea-7b6f-406c-9545-468014df990f.chart" . }}
{{ include "go-echo7c8d5eea-7b6f-406c-9545-468014df990f.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo7c8d5eea-7b6f-406c-9545-468014df990f.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo7c8d5eea-7b6f-406c-9545-468014df990f.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}