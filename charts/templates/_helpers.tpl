
{{- define "go-echo597026cf-1e9a-49d8-8cfa-0779d337c428.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo597026cf-1e9a-49d8-8cfa-0779d337c428.fullname" -}}
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


{{- define "go-echo597026cf-1e9a-49d8-8cfa-0779d337c428.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo597026cf-1e9a-49d8-8cfa-0779d337c428.labels" -}}
helm.sh/chart: {{ include "go-echo597026cf-1e9a-49d8-8cfa-0779d337c428.chart" . }}
{{ include "go-echo597026cf-1e9a-49d8-8cfa-0779d337c428.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo597026cf-1e9a-49d8-8cfa-0779d337c428.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo597026cf-1e9a-49d8-8cfa-0779d337c428.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}