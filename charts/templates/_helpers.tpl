
{{- define "go-echod103ee9c-9304-4a0f-9784-6027b5209cfb.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod103ee9c-9304-4a0f-9784-6027b5209cfb.fullname" -}}
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


{{- define "go-echod103ee9c-9304-4a0f-9784-6027b5209cfb.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod103ee9c-9304-4a0f-9784-6027b5209cfb.labels" -}}
helm.sh/chart: {{ include "go-echod103ee9c-9304-4a0f-9784-6027b5209cfb.chart" . }}
{{ include "go-echod103ee9c-9304-4a0f-9784-6027b5209cfb.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod103ee9c-9304-4a0f-9784-6027b5209cfb.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod103ee9c-9304-4a0f-9784-6027b5209cfb.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}