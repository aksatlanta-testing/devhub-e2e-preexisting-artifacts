
{{- define "go-echoe8a59c65-d303-4b8e-8d81-1bb4ca4a3325.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe8a59c65-d303-4b8e-8d81-1bb4ca4a3325.fullname" -}}
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


{{- define "go-echoe8a59c65-d303-4b8e-8d81-1bb4ca4a3325.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe8a59c65-d303-4b8e-8d81-1bb4ca4a3325.labels" -}}
helm.sh/chart: {{ include "go-echoe8a59c65-d303-4b8e-8d81-1bb4ca4a3325.chart" . }}
{{ include "go-echoe8a59c65-d303-4b8e-8d81-1bb4ca4a3325.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoe8a59c65-d303-4b8e-8d81-1bb4ca4a3325.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoe8a59c65-d303-4b8e-8d81-1bb4ca4a3325.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}