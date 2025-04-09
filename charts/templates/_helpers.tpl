
{{- define "go-echof06ecc13-4f6d-45db-b186-b9f1c66ac9df.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof06ecc13-4f6d-45db-b186-b9f1c66ac9df.fullname" -}}
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


{{- define "go-echof06ecc13-4f6d-45db-b186-b9f1c66ac9df.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof06ecc13-4f6d-45db-b186-b9f1c66ac9df.labels" -}}
helm.sh/chart: {{ include "go-echof06ecc13-4f6d-45db-b186-b9f1c66ac9df.chart" . }}
{{ include "go-echof06ecc13-4f6d-45db-b186-b9f1c66ac9df.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof06ecc13-4f6d-45db-b186-b9f1c66ac9df.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof06ecc13-4f6d-45db-b186-b9f1c66ac9df.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}