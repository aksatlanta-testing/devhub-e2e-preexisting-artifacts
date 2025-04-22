
{{- define "go-echoabb94a36-e947-438d-ad55-3614b45df291.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoabb94a36-e947-438d-ad55-3614b45df291.fullname" -}}
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


{{- define "go-echoabb94a36-e947-438d-ad55-3614b45df291.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoabb94a36-e947-438d-ad55-3614b45df291.labels" -}}
helm.sh/chart: {{ include "go-echoabb94a36-e947-438d-ad55-3614b45df291.chart" . }}
{{ include "go-echoabb94a36-e947-438d-ad55-3614b45df291.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoabb94a36-e947-438d-ad55-3614b45df291.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoabb94a36-e947-438d-ad55-3614b45df291.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}