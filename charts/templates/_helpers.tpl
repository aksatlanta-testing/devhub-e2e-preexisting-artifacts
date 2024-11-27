
{{- define "go-echo4f0a23f9-1e12-4feb-863f-7de438c0ba28.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo4f0a23f9-1e12-4feb-863f-7de438c0ba28.fullname" -}}
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


{{- define "go-echo4f0a23f9-1e12-4feb-863f-7de438c0ba28.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo4f0a23f9-1e12-4feb-863f-7de438c0ba28.labels" -}}
helm.sh/chart: {{ include "go-echo4f0a23f9-1e12-4feb-863f-7de438c0ba28.chart" . }}
{{ include "go-echo4f0a23f9-1e12-4feb-863f-7de438c0ba28.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo4f0a23f9-1e12-4feb-863f-7de438c0ba28.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo4f0a23f9-1e12-4feb-863f-7de438c0ba28.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}