
{{- define "go-echoe4240a09-8b10-4d8a-8237-6bc2a577a686.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe4240a09-8b10-4d8a-8237-6bc2a577a686.fullname" -}}
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


{{- define "go-echoe4240a09-8b10-4d8a-8237-6bc2a577a686.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe4240a09-8b10-4d8a-8237-6bc2a577a686.labels" -}}
helm.sh/chart: {{ include "go-echoe4240a09-8b10-4d8a-8237-6bc2a577a686.chart" . }}
{{ include "go-echoe4240a09-8b10-4d8a-8237-6bc2a577a686.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoe4240a09-8b10-4d8a-8237-6bc2a577a686.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoe4240a09-8b10-4d8a-8237-6bc2a577a686.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}