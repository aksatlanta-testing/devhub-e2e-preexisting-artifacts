
{{- define "go-echo9a69d15a-8e32-4030-9f7f-29d59708576b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo9a69d15a-8e32-4030-9f7f-29d59708576b.fullname" -}}
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


{{- define "go-echo9a69d15a-8e32-4030-9f7f-29d59708576b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo9a69d15a-8e32-4030-9f7f-29d59708576b.labels" -}}
helm.sh/chart: {{ include "go-echo9a69d15a-8e32-4030-9f7f-29d59708576b.chart" . }}
{{ include "go-echo9a69d15a-8e32-4030-9f7f-29d59708576b.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo9a69d15a-8e32-4030-9f7f-29d59708576b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo9a69d15a-8e32-4030-9f7f-29d59708576b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}