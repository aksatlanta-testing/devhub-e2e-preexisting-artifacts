
{{- define "go-echo48f2da1a-bc6b-417b-b774-dfa15babf6cc.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo48f2da1a-bc6b-417b-b774-dfa15babf6cc.fullname" -}}
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


{{- define "go-echo48f2da1a-bc6b-417b-b774-dfa15babf6cc.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo48f2da1a-bc6b-417b-b774-dfa15babf6cc.labels" -}}
helm.sh/chart: {{ include "go-echo48f2da1a-bc6b-417b-b774-dfa15babf6cc.chart" . }}
{{ include "go-echo48f2da1a-bc6b-417b-b774-dfa15babf6cc.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo48f2da1a-bc6b-417b-b774-dfa15babf6cc.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo48f2da1a-bc6b-417b-b774-dfa15babf6cc.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}