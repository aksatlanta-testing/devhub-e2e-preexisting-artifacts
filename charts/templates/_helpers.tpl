
{{- define "go-echoded0b8e0-c378-4ead-9b28-f5e4ded7e071.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoded0b8e0-c378-4ead-9b28-f5e4ded7e071.fullname" -}}
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


{{- define "go-echoded0b8e0-c378-4ead-9b28-f5e4ded7e071.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoded0b8e0-c378-4ead-9b28-f5e4ded7e071.labels" -}}
helm.sh/chart: {{ include "go-echoded0b8e0-c378-4ead-9b28-f5e4ded7e071.chart" . }}
{{ include "go-echoded0b8e0-c378-4ead-9b28-f5e4ded7e071.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoded0b8e0-c378-4ead-9b28-f5e4ded7e071.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoded0b8e0-c378-4ead-9b28-f5e4ded7e071.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}