
{{- define "go-echof8dead14-63fb-4e19-93d5-70e1d7c0f760.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof8dead14-63fb-4e19-93d5-70e1d7c0f760.fullname" -}}
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


{{- define "go-echof8dead14-63fb-4e19-93d5-70e1d7c0f760.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof8dead14-63fb-4e19-93d5-70e1d7c0f760.labels" -}}
helm.sh/chart: {{ include "go-echof8dead14-63fb-4e19-93d5-70e1d7c0f760.chart" . }}
{{ include "go-echof8dead14-63fb-4e19-93d5-70e1d7c0f760.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof8dead14-63fb-4e19-93d5-70e1d7c0f760.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof8dead14-63fb-4e19-93d5-70e1d7c0f760.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}