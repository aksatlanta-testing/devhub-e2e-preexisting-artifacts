
{{- define "go-echo3b703f51-b21d-4b32-999f-64d766f0c7f3.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo3b703f51-b21d-4b32-999f-64d766f0c7f3.fullname" -}}
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


{{- define "go-echo3b703f51-b21d-4b32-999f-64d766f0c7f3.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo3b703f51-b21d-4b32-999f-64d766f0c7f3.labels" -}}
helm.sh/chart: {{ include "go-echo3b703f51-b21d-4b32-999f-64d766f0c7f3.chart" . }}
{{ include "go-echo3b703f51-b21d-4b32-999f-64d766f0c7f3.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo3b703f51-b21d-4b32-999f-64d766f0c7f3.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo3b703f51-b21d-4b32-999f-64d766f0c7f3.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}