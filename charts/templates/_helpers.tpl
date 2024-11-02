
{{- define "go-echo31c7506d-844c-46b2-9f1d-9c1761c9eb7b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo31c7506d-844c-46b2-9f1d-9c1761c9eb7b.fullname" -}}
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


{{- define "go-echo31c7506d-844c-46b2-9f1d-9c1761c9eb7b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo31c7506d-844c-46b2-9f1d-9c1761c9eb7b.labels" -}}
helm.sh/chart: {{ include "go-echo31c7506d-844c-46b2-9f1d-9c1761c9eb7b.chart" . }}
{{ include "go-echo31c7506d-844c-46b2-9f1d-9c1761c9eb7b.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo31c7506d-844c-46b2-9f1d-9c1761c9eb7b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo31c7506d-844c-46b2-9f1d-9c1761c9eb7b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}