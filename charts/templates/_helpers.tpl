
{{- define "go-echob70cefd0-84ff-4033-a2ef-de18c3513cce.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob70cefd0-84ff-4033-a2ef-de18c3513cce.fullname" -}}
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


{{- define "go-echob70cefd0-84ff-4033-a2ef-de18c3513cce.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob70cefd0-84ff-4033-a2ef-de18c3513cce.labels" -}}
helm.sh/chart: {{ include "go-echob70cefd0-84ff-4033-a2ef-de18c3513cce.chart" . }}
{{ include "go-echob70cefd0-84ff-4033-a2ef-de18c3513cce.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echob70cefd0-84ff-4033-a2ef-de18c3513cce.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echob70cefd0-84ff-4033-a2ef-de18c3513cce.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}