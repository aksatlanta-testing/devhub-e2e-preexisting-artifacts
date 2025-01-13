
{{- define "go-echo86ce66fc-6c03-4509-9edb-3cc8f8d37997.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo86ce66fc-6c03-4509-9edb-3cc8f8d37997.fullname" -}}
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


{{- define "go-echo86ce66fc-6c03-4509-9edb-3cc8f8d37997.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo86ce66fc-6c03-4509-9edb-3cc8f8d37997.labels" -}}
helm.sh/chart: {{ include "go-echo86ce66fc-6c03-4509-9edb-3cc8f8d37997.chart" . }}
{{ include "go-echo86ce66fc-6c03-4509-9edb-3cc8f8d37997.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo86ce66fc-6c03-4509-9edb-3cc8f8d37997.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo86ce66fc-6c03-4509-9edb-3cc8f8d37997.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}