
{{- define "go-echoa1cbb46c-44bd-4ad0-9b2d-5cc3cdac5e58.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa1cbb46c-44bd-4ad0-9b2d-5cc3cdac5e58.fullname" -}}
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


{{- define "go-echoa1cbb46c-44bd-4ad0-9b2d-5cc3cdac5e58.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa1cbb46c-44bd-4ad0-9b2d-5cc3cdac5e58.labels" -}}
helm.sh/chart: {{ include "go-echoa1cbb46c-44bd-4ad0-9b2d-5cc3cdac5e58.chart" . }}
{{ include "go-echoa1cbb46c-44bd-4ad0-9b2d-5cc3cdac5e58.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa1cbb46c-44bd-4ad0-9b2d-5cc3cdac5e58.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa1cbb46c-44bd-4ad0-9b2d-5cc3cdac5e58.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}