
{{- define "go-echobb127106-19ca-4a1b-920c-4318fb710e1d.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobb127106-19ca-4a1b-920c-4318fb710e1d.fullname" -}}
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


{{- define "go-echobb127106-19ca-4a1b-920c-4318fb710e1d.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobb127106-19ca-4a1b-920c-4318fb710e1d.labels" -}}
helm.sh/chart: {{ include "go-echobb127106-19ca-4a1b-920c-4318fb710e1d.chart" . }}
{{ include "go-echobb127106-19ca-4a1b-920c-4318fb710e1d.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echobb127106-19ca-4a1b-920c-4318fb710e1d.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echobb127106-19ca-4a1b-920c-4318fb710e1d.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}