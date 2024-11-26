
{{- define "go-echo71df1341-a3e0-4675-badb-5feb17f3e69c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo71df1341-a3e0-4675-badb-5feb17f3e69c.fullname" -}}
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


{{- define "go-echo71df1341-a3e0-4675-badb-5feb17f3e69c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo71df1341-a3e0-4675-badb-5feb17f3e69c.labels" -}}
helm.sh/chart: {{ include "go-echo71df1341-a3e0-4675-badb-5feb17f3e69c.chart" . }}
{{ include "go-echo71df1341-a3e0-4675-badb-5feb17f3e69c.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo71df1341-a3e0-4675-badb-5feb17f3e69c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo71df1341-a3e0-4675-badb-5feb17f3e69c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}