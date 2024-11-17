
{{- define "go-echo57e71aa0-060f-4147-91bd-e190454e0564.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo57e71aa0-060f-4147-91bd-e190454e0564.fullname" -}}
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


{{- define "go-echo57e71aa0-060f-4147-91bd-e190454e0564.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo57e71aa0-060f-4147-91bd-e190454e0564.labels" -}}
helm.sh/chart: {{ include "go-echo57e71aa0-060f-4147-91bd-e190454e0564.chart" . }}
{{ include "go-echo57e71aa0-060f-4147-91bd-e190454e0564.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo57e71aa0-060f-4147-91bd-e190454e0564.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo57e71aa0-060f-4147-91bd-e190454e0564.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}