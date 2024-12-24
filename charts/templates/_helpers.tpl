
{{- define "go-echo00a1f066-47d3-4ffa-b665-15add9fe4cdc.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo00a1f066-47d3-4ffa-b665-15add9fe4cdc.fullname" -}}
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


{{- define "go-echo00a1f066-47d3-4ffa-b665-15add9fe4cdc.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo00a1f066-47d3-4ffa-b665-15add9fe4cdc.labels" -}}
helm.sh/chart: {{ include "go-echo00a1f066-47d3-4ffa-b665-15add9fe4cdc.chart" . }}
{{ include "go-echo00a1f066-47d3-4ffa-b665-15add9fe4cdc.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo00a1f066-47d3-4ffa-b665-15add9fe4cdc.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo00a1f066-47d3-4ffa-b665-15add9fe4cdc.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}