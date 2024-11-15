
{{- define "go-echocad0e83b-2a59-4a4a-b347-6714052db429.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocad0e83b-2a59-4a4a-b347-6714052db429.fullname" -}}
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


{{- define "go-echocad0e83b-2a59-4a4a-b347-6714052db429.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocad0e83b-2a59-4a4a-b347-6714052db429.labels" -}}
helm.sh/chart: {{ include "go-echocad0e83b-2a59-4a4a-b347-6714052db429.chart" . }}
{{ include "go-echocad0e83b-2a59-4a4a-b347-6714052db429.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echocad0e83b-2a59-4a4a-b347-6714052db429.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echocad0e83b-2a59-4a4a-b347-6714052db429.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}