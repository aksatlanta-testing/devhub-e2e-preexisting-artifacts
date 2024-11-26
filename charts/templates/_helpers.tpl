
{{- define "go-echod478d566-3c04-4df3-93ab-4de6014a8cfe.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod478d566-3c04-4df3-93ab-4de6014a8cfe.fullname" -}}
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


{{- define "go-echod478d566-3c04-4df3-93ab-4de6014a8cfe.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod478d566-3c04-4df3-93ab-4de6014a8cfe.labels" -}}
helm.sh/chart: {{ include "go-echod478d566-3c04-4df3-93ab-4de6014a8cfe.chart" . }}
{{ include "go-echod478d566-3c04-4df3-93ab-4de6014a8cfe.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod478d566-3c04-4df3-93ab-4de6014a8cfe.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod478d566-3c04-4df3-93ab-4de6014a8cfe.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}