
{{- define "go-echob471cdb4-85ae-4a3a-b5d7-42172b2a5456.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob471cdb4-85ae-4a3a-b5d7-42172b2a5456.fullname" -}}
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


{{- define "go-echob471cdb4-85ae-4a3a-b5d7-42172b2a5456.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob471cdb4-85ae-4a3a-b5d7-42172b2a5456.labels" -}}
helm.sh/chart: {{ include "go-echob471cdb4-85ae-4a3a-b5d7-42172b2a5456.chart" . }}
{{ include "go-echob471cdb4-85ae-4a3a-b5d7-42172b2a5456.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echob471cdb4-85ae-4a3a-b5d7-42172b2a5456.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echob471cdb4-85ae-4a3a-b5d7-42172b2a5456.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}