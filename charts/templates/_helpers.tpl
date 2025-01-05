
{{- define "go-echoc72340fb-6659-49fc-9174-b0f9bcb8d227.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc72340fb-6659-49fc-9174-b0f9bcb8d227.fullname" -}}
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


{{- define "go-echoc72340fb-6659-49fc-9174-b0f9bcb8d227.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc72340fb-6659-49fc-9174-b0f9bcb8d227.labels" -}}
helm.sh/chart: {{ include "go-echoc72340fb-6659-49fc-9174-b0f9bcb8d227.chart" . }}
{{ include "go-echoc72340fb-6659-49fc-9174-b0f9bcb8d227.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoc72340fb-6659-49fc-9174-b0f9bcb8d227.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoc72340fb-6659-49fc-9174-b0f9bcb8d227.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}