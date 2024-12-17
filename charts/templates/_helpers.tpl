
{{- define "go-echofeb330bb-e929-4b68-98a5-610a8c0b308f.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofeb330bb-e929-4b68-98a5-610a8c0b308f.fullname" -}}
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


{{- define "go-echofeb330bb-e929-4b68-98a5-610a8c0b308f.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofeb330bb-e929-4b68-98a5-610a8c0b308f.labels" -}}
helm.sh/chart: {{ include "go-echofeb330bb-e929-4b68-98a5-610a8c0b308f.chart" . }}
{{ include "go-echofeb330bb-e929-4b68-98a5-610a8c0b308f.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echofeb330bb-e929-4b68-98a5-610a8c0b308f.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echofeb330bb-e929-4b68-98a5-610a8c0b308f.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}