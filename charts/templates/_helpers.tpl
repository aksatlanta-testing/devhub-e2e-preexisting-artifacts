
{{- define "go-echo749e2616-c778-4f97-a587-d1b407558877.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo749e2616-c778-4f97-a587-d1b407558877.fullname" -}}
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


{{- define "go-echo749e2616-c778-4f97-a587-d1b407558877.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo749e2616-c778-4f97-a587-d1b407558877.labels" -}}
helm.sh/chart: {{ include "go-echo749e2616-c778-4f97-a587-d1b407558877.chart" . }}
{{ include "go-echo749e2616-c778-4f97-a587-d1b407558877.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo749e2616-c778-4f97-a587-d1b407558877.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo749e2616-c778-4f97-a587-d1b407558877.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}