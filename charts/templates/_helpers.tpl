
{{- define "go-echo7a63a71b-5826-4bc3-972e-28131d8956ae.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo7a63a71b-5826-4bc3-972e-28131d8956ae.fullname" -}}
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


{{- define "go-echo7a63a71b-5826-4bc3-972e-28131d8956ae.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo7a63a71b-5826-4bc3-972e-28131d8956ae.labels" -}}
helm.sh/chart: {{ include "go-echo7a63a71b-5826-4bc3-972e-28131d8956ae.chart" . }}
{{ include "go-echo7a63a71b-5826-4bc3-972e-28131d8956ae.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo7a63a71b-5826-4bc3-972e-28131d8956ae.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo7a63a71b-5826-4bc3-972e-28131d8956ae.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}