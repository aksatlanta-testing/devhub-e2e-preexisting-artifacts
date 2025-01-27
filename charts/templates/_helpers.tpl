
{{- define "go-echo7e350fc6-37f5-42c7-8af3-c762219a3fac.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo7e350fc6-37f5-42c7-8af3-c762219a3fac.fullname" -}}
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


{{- define "go-echo7e350fc6-37f5-42c7-8af3-c762219a3fac.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo7e350fc6-37f5-42c7-8af3-c762219a3fac.labels" -}}
helm.sh/chart: {{ include "go-echo7e350fc6-37f5-42c7-8af3-c762219a3fac.chart" . }}
{{ include "go-echo7e350fc6-37f5-42c7-8af3-c762219a3fac.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo7e350fc6-37f5-42c7-8af3-c762219a3fac.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo7e350fc6-37f5-42c7-8af3-c762219a3fac.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}