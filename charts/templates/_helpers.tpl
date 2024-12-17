
{{- define "go-echo195f1bd4-7dab-4617-94e8-c7f762abe689.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo195f1bd4-7dab-4617-94e8-c7f762abe689.fullname" -}}
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


{{- define "go-echo195f1bd4-7dab-4617-94e8-c7f762abe689.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo195f1bd4-7dab-4617-94e8-c7f762abe689.labels" -}}
helm.sh/chart: {{ include "go-echo195f1bd4-7dab-4617-94e8-c7f762abe689.chart" . }}
{{ include "go-echo195f1bd4-7dab-4617-94e8-c7f762abe689.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo195f1bd4-7dab-4617-94e8-c7f762abe689.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo195f1bd4-7dab-4617-94e8-c7f762abe689.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}