
{{- define "go-echobba6ab64-ae41-432d-b3e4-326019ce8338.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobba6ab64-ae41-432d-b3e4-326019ce8338.fullname" -}}
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


{{- define "go-echobba6ab64-ae41-432d-b3e4-326019ce8338.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobba6ab64-ae41-432d-b3e4-326019ce8338.labels" -}}
helm.sh/chart: {{ include "go-echobba6ab64-ae41-432d-b3e4-326019ce8338.chart" . }}
{{ include "go-echobba6ab64-ae41-432d-b3e4-326019ce8338.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echobba6ab64-ae41-432d-b3e4-326019ce8338.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echobba6ab64-ae41-432d-b3e4-326019ce8338.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}