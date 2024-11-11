
{{- define "go-echo48d7cd5d-7986-4bf6-8402-7c4793604480.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo48d7cd5d-7986-4bf6-8402-7c4793604480.fullname" -}}
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


{{- define "go-echo48d7cd5d-7986-4bf6-8402-7c4793604480.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo48d7cd5d-7986-4bf6-8402-7c4793604480.labels" -}}
helm.sh/chart: {{ include "go-echo48d7cd5d-7986-4bf6-8402-7c4793604480.chart" . }}
{{ include "go-echo48d7cd5d-7986-4bf6-8402-7c4793604480.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo48d7cd5d-7986-4bf6-8402-7c4793604480.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo48d7cd5d-7986-4bf6-8402-7c4793604480.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}