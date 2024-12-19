
{{- define "go-echo873d7a0a-1d89-4243-9a3f-477bde3a1bb5.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo873d7a0a-1d89-4243-9a3f-477bde3a1bb5.fullname" -}}
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


{{- define "go-echo873d7a0a-1d89-4243-9a3f-477bde3a1bb5.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo873d7a0a-1d89-4243-9a3f-477bde3a1bb5.labels" -}}
helm.sh/chart: {{ include "go-echo873d7a0a-1d89-4243-9a3f-477bde3a1bb5.chart" . }}
{{ include "go-echo873d7a0a-1d89-4243-9a3f-477bde3a1bb5.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo873d7a0a-1d89-4243-9a3f-477bde3a1bb5.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo873d7a0a-1d89-4243-9a3f-477bde3a1bb5.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}