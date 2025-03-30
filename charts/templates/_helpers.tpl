
{{- define "go-echod970c261-e721-4bbf-9404-902f5bb8c949.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod970c261-e721-4bbf-9404-902f5bb8c949.fullname" -}}
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


{{- define "go-echod970c261-e721-4bbf-9404-902f5bb8c949.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod970c261-e721-4bbf-9404-902f5bb8c949.labels" -}}
helm.sh/chart: {{ include "go-echod970c261-e721-4bbf-9404-902f5bb8c949.chart" . }}
{{ include "go-echod970c261-e721-4bbf-9404-902f5bb8c949.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod970c261-e721-4bbf-9404-902f5bb8c949.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod970c261-e721-4bbf-9404-902f5bb8c949.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}