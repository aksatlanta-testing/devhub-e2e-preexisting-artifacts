
{{- define "go-echof14b3936-5b10-4fec-8680-123b504139b6.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof14b3936-5b10-4fec-8680-123b504139b6.fullname" -}}
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


{{- define "go-echof14b3936-5b10-4fec-8680-123b504139b6.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof14b3936-5b10-4fec-8680-123b504139b6.labels" -}}
helm.sh/chart: {{ include "go-echof14b3936-5b10-4fec-8680-123b504139b6.chart" . }}
{{ include "go-echof14b3936-5b10-4fec-8680-123b504139b6.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof14b3936-5b10-4fec-8680-123b504139b6.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof14b3936-5b10-4fec-8680-123b504139b6.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}