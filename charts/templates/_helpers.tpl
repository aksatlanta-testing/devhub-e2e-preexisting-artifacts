
{{- define "go-echoa77f4757-13ba-4009-ba29-16ead26d0541.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa77f4757-13ba-4009-ba29-16ead26d0541.fullname" -}}
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


{{- define "go-echoa77f4757-13ba-4009-ba29-16ead26d0541.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa77f4757-13ba-4009-ba29-16ead26d0541.labels" -}}
helm.sh/chart: {{ include "go-echoa77f4757-13ba-4009-ba29-16ead26d0541.chart" . }}
{{ include "go-echoa77f4757-13ba-4009-ba29-16ead26d0541.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa77f4757-13ba-4009-ba29-16ead26d0541.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa77f4757-13ba-4009-ba29-16ead26d0541.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}