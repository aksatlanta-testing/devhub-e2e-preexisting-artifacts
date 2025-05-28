
{{- define "go-echoa7724182-f198-4149-98b5-fbc97f9353dd.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa7724182-f198-4149-98b5-fbc97f9353dd.fullname" -}}
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


{{- define "go-echoa7724182-f198-4149-98b5-fbc97f9353dd.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa7724182-f198-4149-98b5-fbc97f9353dd.labels" -}}
helm.sh/chart: {{ include "go-echoa7724182-f198-4149-98b5-fbc97f9353dd.chart" . }}
{{ include "go-echoa7724182-f198-4149-98b5-fbc97f9353dd.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa7724182-f198-4149-98b5-fbc97f9353dd.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa7724182-f198-4149-98b5-fbc97f9353dd.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}