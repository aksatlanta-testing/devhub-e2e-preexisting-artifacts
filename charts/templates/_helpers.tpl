
{{- define "go-echod306d9a8-904c-49d8-af15-4c26d12f7651.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod306d9a8-904c-49d8-af15-4c26d12f7651.fullname" -}}
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


{{- define "go-echod306d9a8-904c-49d8-af15-4c26d12f7651.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod306d9a8-904c-49d8-af15-4c26d12f7651.labels" -}}
helm.sh/chart: {{ include "go-echod306d9a8-904c-49d8-af15-4c26d12f7651.chart" . }}
{{ include "go-echod306d9a8-904c-49d8-af15-4c26d12f7651.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod306d9a8-904c-49d8-af15-4c26d12f7651.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod306d9a8-904c-49d8-af15-4c26d12f7651.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}