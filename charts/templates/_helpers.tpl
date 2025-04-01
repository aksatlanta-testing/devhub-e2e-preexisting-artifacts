
{{- define "go-echobe178141-b69f-4290-b5c9-9fde27cf34be.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobe178141-b69f-4290-b5c9-9fde27cf34be.fullname" -}}
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


{{- define "go-echobe178141-b69f-4290-b5c9-9fde27cf34be.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobe178141-b69f-4290-b5c9-9fde27cf34be.labels" -}}
helm.sh/chart: {{ include "go-echobe178141-b69f-4290-b5c9-9fde27cf34be.chart" . }}
{{ include "go-echobe178141-b69f-4290-b5c9-9fde27cf34be.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echobe178141-b69f-4290-b5c9-9fde27cf34be.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echobe178141-b69f-4290-b5c9-9fde27cf34be.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}