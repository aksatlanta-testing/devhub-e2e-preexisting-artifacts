
{{- define "go-echo5d1d8659-98c6-43cd-844c-3c49a9d6bf7c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo5d1d8659-98c6-43cd-844c-3c49a9d6bf7c.fullname" -}}
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


{{- define "go-echo5d1d8659-98c6-43cd-844c-3c49a9d6bf7c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo5d1d8659-98c6-43cd-844c-3c49a9d6bf7c.labels" -}}
helm.sh/chart: {{ include "go-echo5d1d8659-98c6-43cd-844c-3c49a9d6bf7c.chart" . }}
{{ include "go-echo5d1d8659-98c6-43cd-844c-3c49a9d6bf7c.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo5d1d8659-98c6-43cd-844c-3c49a9d6bf7c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo5d1d8659-98c6-43cd-844c-3c49a9d6bf7c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}