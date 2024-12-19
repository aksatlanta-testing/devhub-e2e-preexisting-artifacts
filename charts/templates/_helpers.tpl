
{{- define "go-echocca01fea-c2fa-4629-8ea6-7b70450f761c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocca01fea-c2fa-4629-8ea6-7b70450f761c.fullname" -}}
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


{{- define "go-echocca01fea-c2fa-4629-8ea6-7b70450f761c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocca01fea-c2fa-4629-8ea6-7b70450f761c.labels" -}}
helm.sh/chart: {{ include "go-echocca01fea-c2fa-4629-8ea6-7b70450f761c.chart" . }}
{{ include "go-echocca01fea-c2fa-4629-8ea6-7b70450f761c.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echocca01fea-c2fa-4629-8ea6-7b70450f761c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echocca01fea-c2fa-4629-8ea6-7b70450f761c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}