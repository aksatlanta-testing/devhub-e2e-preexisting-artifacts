
{{- define "go-echo42de7813-b7c8-40b4-a697-ab35dd8cef4b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo42de7813-b7c8-40b4-a697-ab35dd8cef4b.fullname" -}}
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


{{- define "go-echo42de7813-b7c8-40b4-a697-ab35dd8cef4b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo42de7813-b7c8-40b4-a697-ab35dd8cef4b.labels" -}}
helm.sh/chart: {{ include "go-echo42de7813-b7c8-40b4-a697-ab35dd8cef4b.chart" . }}
{{ include "go-echo42de7813-b7c8-40b4-a697-ab35dd8cef4b.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo42de7813-b7c8-40b4-a697-ab35dd8cef4b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo42de7813-b7c8-40b4-a697-ab35dd8cef4b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}