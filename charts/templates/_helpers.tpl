
{{- define "go-echo265e2cd3-f54e-4608-9bed-6db655de7caa.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo265e2cd3-f54e-4608-9bed-6db655de7caa.fullname" -}}
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


{{- define "go-echo265e2cd3-f54e-4608-9bed-6db655de7caa.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo265e2cd3-f54e-4608-9bed-6db655de7caa.labels" -}}
helm.sh/chart: {{ include "go-echo265e2cd3-f54e-4608-9bed-6db655de7caa.chart" . }}
{{ include "go-echo265e2cd3-f54e-4608-9bed-6db655de7caa.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo265e2cd3-f54e-4608-9bed-6db655de7caa.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo265e2cd3-f54e-4608-9bed-6db655de7caa.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}