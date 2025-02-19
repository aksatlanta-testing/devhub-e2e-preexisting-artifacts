
{{- define "go-echo74f39f04-3a20-4c62-98c4-140776677bfa.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo74f39f04-3a20-4c62-98c4-140776677bfa.fullname" -}}
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


{{- define "go-echo74f39f04-3a20-4c62-98c4-140776677bfa.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo74f39f04-3a20-4c62-98c4-140776677bfa.labels" -}}
helm.sh/chart: {{ include "go-echo74f39f04-3a20-4c62-98c4-140776677bfa.chart" . }}
{{ include "go-echo74f39f04-3a20-4c62-98c4-140776677bfa.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo74f39f04-3a20-4c62-98c4-140776677bfa.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo74f39f04-3a20-4c62-98c4-140776677bfa.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}