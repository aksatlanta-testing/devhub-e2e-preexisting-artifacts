
{{- define "go-echo93f50f1d-081d-478d-9f05-5aca8bde8de3.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo93f50f1d-081d-478d-9f05-5aca8bde8de3.fullname" -}}
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


{{- define "go-echo93f50f1d-081d-478d-9f05-5aca8bde8de3.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo93f50f1d-081d-478d-9f05-5aca8bde8de3.labels" -}}
helm.sh/chart: {{ include "go-echo93f50f1d-081d-478d-9f05-5aca8bde8de3.chart" . }}
{{ include "go-echo93f50f1d-081d-478d-9f05-5aca8bde8de3.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo93f50f1d-081d-478d-9f05-5aca8bde8de3.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo93f50f1d-081d-478d-9f05-5aca8bde8de3.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}