
{{- define "go-echod303ed7e-19f5-40ac-9529-2a8fc93c96bb.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod303ed7e-19f5-40ac-9529-2a8fc93c96bb.fullname" -}}
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


{{- define "go-echod303ed7e-19f5-40ac-9529-2a8fc93c96bb.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod303ed7e-19f5-40ac-9529-2a8fc93c96bb.labels" -}}
helm.sh/chart: {{ include "go-echod303ed7e-19f5-40ac-9529-2a8fc93c96bb.chart" . }}
{{ include "go-echod303ed7e-19f5-40ac-9529-2a8fc93c96bb.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod303ed7e-19f5-40ac-9529-2a8fc93c96bb.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod303ed7e-19f5-40ac-9529-2a8fc93c96bb.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}