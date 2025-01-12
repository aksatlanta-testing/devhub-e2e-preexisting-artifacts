
{{- define "go-echob0f76d77-3b60-4c1d-8491-40b592f907ef.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob0f76d77-3b60-4c1d-8491-40b592f907ef.fullname" -}}
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


{{- define "go-echob0f76d77-3b60-4c1d-8491-40b592f907ef.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob0f76d77-3b60-4c1d-8491-40b592f907ef.labels" -}}
helm.sh/chart: {{ include "go-echob0f76d77-3b60-4c1d-8491-40b592f907ef.chart" . }}
{{ include "go-echob0f76d77-3b60-4c1d-8491-40b592f907ef.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echob0f76d77-3b60-4c1d-8491-40b592f907ef.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echob0f76d77-3b60-4c1d-8491-40b592f907ef.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}