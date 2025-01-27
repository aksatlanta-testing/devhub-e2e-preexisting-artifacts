
{{- define "go-echo8b48f0d8-1382-44e7-a1ad-99a9e2ca2708.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo8b48f0d8-1382-44e7-a1ad-99a9e2ca2708.fullname" -}}
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


{{- define "go-echo8b48f0d8-1382-44e7-a1ad-99a9e2ca2708.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo8b48f0d8-1382-44e7-a1ad-99a9e2ca2708.labels" -}}
helm.sh/chart: {{ include "go-echo8b48f0d8-1382-44e7-a1ad-99a9e2ca2708.chart" . }}
{{ include "go-echo8b48f0d8-1382-44e7-a1ad-99a9e2ca2708.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo8b48f0d8-1382-44e7-a1ad-99a9e2ca2708.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo8b48f0d8-1382-44e7-a1ad-99a9e2ca2708.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}