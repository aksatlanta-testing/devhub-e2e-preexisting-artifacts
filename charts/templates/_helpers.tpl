
{{- define "go-echoc3c34da1-5db2-44fb-8b35-da57e9ab2179.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc3c34da1-5db2-44fb-8b35-da57e9ab2179.fullname" -}}
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


{{- define "go-echoc3c34da1-5db2-44fb-8b35-da57e9ab2179.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc3c34da1-5db2-44fb-8b35-da57e9ab2179.labels" -}}
helm.sh/chart: {{ include "go-echoc3c34da1-5db2-44fb-8b35-da57e9ab2179.chart" . }}
{{ include "go-echoc3c34da1-5db2-44fb-8b35-da57e9ab2179.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoc3c34da1-5db2-44fb-8b35-da57e9ab2179.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoc3c34da1-5db2-44fb-8b35-da57e9ab2179.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}