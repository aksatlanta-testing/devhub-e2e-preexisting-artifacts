
{{- define "go-echo8fbb275c-99b3-4ff2-b716-fb43d31ec804.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo8fbb275c-99b3-4ff2-b716-fb43d31ec804.fullname" -}}
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


{{- define "go-echo8fbb275c-99b3-4ff2-b716-fb43d31ec804.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo8fbb275c-99b3-4ff2-b716-fb43d31ec804.labels" -}}
helm.sh/chart: {{ include "go-echo8fbb275c-99b3-4ff2-b716-fb43d31ec804.chart" . }}
{{ include "go-echo8fbb275c-99b3-4ff2-b716-fb43d31ec804.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo8fbb275c-99b3-4ff2-b716-fb43d31ec804.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo8fbb275c-99b3-4ff2-b716-fb43d31ec804.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}