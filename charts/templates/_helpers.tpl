
{{- define "go-echo15cc31db-a710-4b7c-bd13-3a6d949f7b54.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo15cc31db-a710-4b7c-bd13-3a6d949f7b54.fullname" -}}
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


{{- define "go-echo15cc31db-a710-4b7c-bd13-3a6d949f7b54.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo15cc31db-a710-4b7c-bd13-3a6d949f7b54.labels" -}}
helm.sh/chart: {{ include "go-echo15cc31db-a710-4b7c-bd13-3a6d949f7b54.chart" . }}
{{ include "go-echo15cc31db-a710-4b7c-bd13-3a6d949f7b54.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo15cc31db-a710-4b7c-bd13-3a6d949f7b54.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo15cc31db-a710-4b7c-bd13-3a6d949f7b54.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}