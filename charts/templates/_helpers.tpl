
{{- define "go-echo61c24110-8c11-41c8-90c0-38ef9555b88e.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo61c24110-8c11-41c8-90c0-38ef9555b88e.fullname" -}}
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


{{- define "go-echo61c24110-8c11-41c8-90c0-38ef9555b88e.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo61c24110-8c11-41c8-90c0-38ef9555b88e.labels" -}}
helm.sh/chart: {{ include "go-echo61c24110-8c11-41c8-90c0-38ef9555b88e.chart" . }}
{{ include "go-echo61c24110-8c11-41c8-90c0-38ef9555b88e.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo61c24110-8c11-41c8-90c0-38ef9555b88e.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo61c24110-8c11-41c8-90c0-38ef9555b88e.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}