
{{- define "go-echo7b4ca536-29ba-4128-8e9b-45170ba3281b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo7b4ca536-29ba-4128-8e9b-45170ba3281b.fullname" -}}
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


{{- define "go-echo7b4ca536-29ba-4128-8e9b-45170ba3281b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo7b4ca536-29ba-4128-8e9b-45170ba3281b.labels" -}}
helm.sh/chart: {{ include "go-echo7b4ca536-29ba-4128-8e9b-45170ba3281b.chart" . }}
{{ include "go-echo7b4ca536-29ba-4128-8e9b-45170ba3281b.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo7b4ca536-29ba-4128-8e9b-45170ba3281b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo7b4ca536-29ba-4128-8e9b-45170ba3281b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}