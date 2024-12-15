
{{- define "go-echoa3ba2b75-8d20-487f-b357-1f3732816bfc.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa3ba2b75-8d20-487f-b357-1f3732816bfc.fullname" -}}
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


{{- define "go-echoa3ba2b75-8d20-487f-b357-1f3732816bfc.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa3ba2b75-8d20-487f-b357-1f3732816bfc.labels" -}}
helm.sh/chart: {{ include "go-echoa3ba2b75-8d20-487f-b357-1f3732816bfc.chart" . }}
{{ include "go-echoa3ba2b75-8d20-487f-b357-1f3732816bfc.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa3ba2b75-8d20-487f-b357-1f3732816bfc.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa3ba2b75-8d20-487f-b357-1f3732816bfc.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}