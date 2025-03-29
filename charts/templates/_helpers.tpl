
{{- define "go-echocfd3a815-da36-4925-b5b5-d6d24197d683.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocfd3a815-da36-4925-b5b5-d6d24197d683.fullname" -}}
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


{{- define "go-echocfd3a815-da36-4925-b5b5-d6d24197d683.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocfd3a815-da36-4925-b5b5-d6d24197d683.labels" -}}
helm.sh/chart: {{ include "go-echocfd3a815-da36-4925-b5b5-d6d24197d683.chart" . }}
{{ include "go-echocfd3a815-da36-4925-b5b5-d6d24197d683.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echocfd3a815-da36-4925-b5b5-d6d24197d683.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echocfd3a815-da36-4925-b5b5-d6d24197d683.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}