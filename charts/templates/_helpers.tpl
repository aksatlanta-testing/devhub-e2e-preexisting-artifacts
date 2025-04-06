
{{- define "go-echodee754e7-6d85-4067-a538-00cdadb64050.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodee754e7-6d85-4067-a538-00cdadb64050.fullname" -}}
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


{{- define "go-echodee754e7-6d85-4067-a538-00cdadb64050.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodee754e7-6d85-4067-a538-00cdadb64050.labels" -}}
helm.sh/chart: {{ include "go-echodee754e7-6d85-4067-a538-00cdadb64050.chart" . }}
{{ include "go-echodee754e7-6d85-4067-a538-00cdadb64050.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echodee754e7-6d85-4067-a538-00cdadb64050.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echodee754e7-6d85-4067-a538-00cdadb64050.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}