
{{- define "go-echo0b4c14e7-3cfb-41b7-b9d6-88c80e28fd2a.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo0b4c14e7-3cfb-41b7-b9d6-88c80e28fd2a.fullname" -}}
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


{{- define "go-echo0b4c14e7-3cfb-41b7-b9d6-88c80e28fd2a.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo0b4c14e7-3cfb-41b7-b9d6-88c80e28fd2a.labels" -}}
helm.sh/chart: {{ include "go-echo0b4c14e7-3cfb-41b7-b9d6-88c80e28fd2a.chart" . }}
{{ include "go-echo0b4c14e7-3cfb-41b7-b9d6-88c80e28fd2a.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo0b4c14e7-3cfb-41b7-b9d6-88c80e28fd2a.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo0b4c14e7-3cfb-41b7-b9d6-88c80e28fd2a.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}