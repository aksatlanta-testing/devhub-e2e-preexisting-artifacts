
{{- define "go-echoe02522b8-34a1-43db-9abe-b265d04e50dd.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe02522b8-34a1-43db-9abe-b265d04e50dd.fullname" -}}
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


{{- define "go-echoe02522b8-34a1-43db-9abe-b265d04e50dd.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe02522b8-34a1-43db-9abe-b265d04e50dd.labels" -}}
helm.sh/chart: {{ include "go-echoe02522b8-34a1-43db-9abe-b265d04e50dd.chart" . }}
{{ include "go-echoe02522b8-34a1-43db-9abe-b265d04e50dd.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoe02522b8-34a1-43db-9abe-b265d04e50dd.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoe02522b8-34a1-43db-9abe-b265d04e50dd.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}