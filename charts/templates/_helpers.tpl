
{{- define "go-echoa1b3fd2b-9c48-47e9-8111-1542457af5da.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa1b3fd2b-9c48-47e9-8111-1542457af5da.fullname" -}}
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


{{- define "go-echoa1b3fd2b-9c48-47e9-8111-1542457af5da.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa1b3fd2b-9c48-47e9-8111-1542457af5da.labels" -}}
helm.sh/chart: {{ include "go-echoa1b3fd2b-9c48-47e9-8111-1542457af5da.chart" . }}
{{ include "go-echoa1b3fd2b-9c48-47e9-8111-1542457af5da.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa1b3fd2b-9c48-47e9-8111-1542457af5da.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa1b3fd2b-9c48-47e9-8111-1542457af5da.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}