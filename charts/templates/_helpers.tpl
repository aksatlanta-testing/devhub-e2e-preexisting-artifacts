
{{- define "go-echoe5c9efcf-e101-46db-a64a-b1b4b87c7d7a.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe5c9efcf-e101-46db-a64a-b1b4b87c7d7a.fullname" -}}
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


{{- define "go-echoe5c9efcf-e101-46db-a64a-b1b4b87c7d7a.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe5c9efcf-e101-46db-a64a-b1b4b87c7d7a.labels" -}}
helm.sh/chart: {{ include "go-echoe5c9efcf-e101-46db-a64a-b1b4b87c7d7a.chart" . }}
{{ include "go-echoe5c9efcf-e101-46db-a64a-b1b4b87c7d7a.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoe5c9efcf-e101-46db-a64a-b1b4b87c7d7a.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoe5c9efcf-e101-46db-a64a-b1b4b87c7d7a.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}