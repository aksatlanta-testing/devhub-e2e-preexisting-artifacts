
{{- define "go-echoe9dc0d63-3cd4-412a-a0fa-2e9e0557ba2b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe9dc0d63-3cd4-412a-a0fa-2e9e0557ba2b.fullname" -}}
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


{{- define "go-echoe9dc0d63-3cd4-412a-a0fa-2e9e0557ba2b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe9dc0d63-3cd4-412a-a0fa-2e9e0557ba2b.labels" -}}
helm.sh/chart: {{ include "go-echoe9dc0d63-3cd4-412a-a0fa-2e9e0557ba2b.chart" . }}
{{ include "go-echoe9dc0d63-3cd4-412a-a0fa-2e9e0557ba2b.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoe9dc0d63-3cd4-412a-a0fa-2e9e0557ba2b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoe9dc0d63-3cd4-412a-a0fa-2e9e0557ba2b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}