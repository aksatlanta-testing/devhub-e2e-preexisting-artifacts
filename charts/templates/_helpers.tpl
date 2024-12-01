
{{- define "go-echoe9fde5cc-8069-45d8-a07d-d83386f8d1fe.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe9fde5cc-8069-45d8-a07d-d83386f8d1fe.fullname" -}}
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


{{- define "go-echoe9fde5cc-8069-45d8-a07d-d83386f8d1fe.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe9fde5cc-8069-45d8-a07d-d83386f8d1fe.labels" -}}
helm.sh/chart: {{ include "go-echoe9fde5cc-8069-45d8-a07d-d83386f8d1fe.chart" . }}
{{ include "go-echoe9fde5cc-8069-45d8-a07d-d83386f8d1fe.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoe9fde5cc-8069-45d8-a07d-d83386f8d1fe.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoe9fde5cc-8069-45d8-a07d-d83386f8d1fe.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}