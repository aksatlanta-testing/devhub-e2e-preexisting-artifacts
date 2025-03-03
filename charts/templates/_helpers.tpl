
{{- define "go-echof21a511e-7c50-42be-9173-79f36011f059.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof21a511e-7c50-42be-9173-79f36011f059.fullname" -}}
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


{{- define "go-echof21a511e-7c50-42be-9173-79f36011f059.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof21a511e-7c50-42be-9173-79f36011f059.labels" -}}
helm.sh/chart: {{ include "go-echof21a511e-7c50-42be-9173-79f36011f059.chart" . }}
{{ include "go-echof21a511e-7c50-42be-9173-79f36011f059.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof21a511e-7c50-42be-9173-79f36011f059.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof21a511e-7c50-42be-9173-79f36011f059.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}