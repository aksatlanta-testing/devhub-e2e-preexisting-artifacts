
{{- define "go-echoefb98c7d-bec6-44c5-a1bd-3c3722fc7ede.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoefb98c7d-bec6-44c5-a1bd-3c3722fc7ede.fullname" -}}
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


{{- define "go-echoefb98c7d-bec6-44c5-a1bd-3c3722fc7ede.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoefb98c7d-bec6-44c5-a1bd-3c3722fc7ede.labels" -}}
helm.sh/chart: {{ include "go-echoefb98c7d-bec6-44c5-a1bd-3c3722fc7ede.chart" . }}
{{ include "go-echoefb98c7d-bec6-44c5-a1bd-3c3722fc7ede.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoefb98c7d-bec6-44c5-a1bd-3c3722fc7ede.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoefb98c7d-bec6-44c5-a1bd-3c3722fc7ede.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}