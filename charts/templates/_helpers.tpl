
{{- define "go-echoa1d94bf2-db0b-4386-bd15-9be4055ff403.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa1d94bf2-db0b-4386-bd15-9be4055ff403.fullname" -}}
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


{{- define "go-echoa1d94bf2-db0b-4386-bd15-9be4055ff403.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa1d94bf2-db0b-4386-bd15-9be4055ff403.labels" -}}
helm.sh/chart: {{ include "go-echoa1d94bf2-db0b-4386-bd15-9be4055ff403.chart" . }}
{{ include "go-echoa1d94bf2-db0b-4386-bd15-9be4055ff403.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa1d94bf2-db0b-4386-bd15-9be4055ff403.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa1d94bf2-db0b-4386-bd15-9be4055ff403.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}