
{{- define "go-echo052f9baf-6707-422d-828c-6c1889d1b387.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo052f9baf-6707-422d-828c-6c1889d1b387.fullname" -}}
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


{{- define "go-echo052f9baf-6707-422d-828c-6c1889d1b387.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo052f9baf-6707-422d-828c-6c1889d1b387.labels" -}}
helm.sh/chart: {{ include "go-echo052f9baf-6707-422d-828c-6c1889d1b387.chart" . }}
{{ include "go-echo052f9baf-6707-422d-828c-6c1889d1b387.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo052f9baf-6707-422d-828c-6c1889d1b387.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo052f9baf-6707-422d-828c-6c1889d1b387.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}