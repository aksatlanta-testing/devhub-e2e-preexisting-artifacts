
{{- define "go-echodaf60323-a4bb-474e-a535-df8e4389e8b8.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodaf60323-a4bb-474e-a535-df8e4389e8b8.fullname" -}}
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


{{- define "go-echodaf60323-a4bb-474e-a535-df8e4389e8b8.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodaf60323-a4bb-474e-a535-df8e4389e8b8.labels" -}}
helm.sh/chart: {{ include "go-echodaf60323-a4bb-474e-a535-df8e4389e8b8.chart" . }}
{{ include "go-echodaf60323-a4bb-474e-a535-df8e4389e8b8.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echodaf60323-a4bb-474e-a535-df8e4389e8b8.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echodaf60323-a4bb-474e-a535-df8e4389e8b8.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}