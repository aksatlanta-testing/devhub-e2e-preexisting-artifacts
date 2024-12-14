
{{- define "go-echo6a595efd-0069-47cf-b7a8-b4164fe5112d.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo6a595efd-0069-47cf-b7a8-b4164fe5112d.fullname" -}}
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


{{- define "go-echo6a595efd-0069-47cf-b7a8-b4164fe5112d.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo6a595efd-0069-47cf-b7a8-b4164fe5112d.labels" -}}
helm.sh/chart: {{ include "go-echo6a595efd-0069-47cf-b7a8-b4164fe5112d.chart" . }}
{{ include "go-echo6a595efd-0069-47cf-b7a8-b4164fe5112d.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo6a595efd-0069-47cf-b7a8-b4164fe5112d.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo6a595efd-0069-47cf-b7a8-b4164fe5112d.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}