
{{- define "go-echoca1e0651-9d68-46e0-ae07-dfb24a77be06.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoca1e0651-9d68-46e0-ae07-dfb24a77be06.fullname" -}}
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


{{- define "go-echoca1e0651-9d68-46e0-ae07-dfb24a77be06.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoca1e0651-9d68-46e0-ae07-dfb24a77be06.labels" -}}
helm.sh/chart: {{ include "go-echoca1e0651-9d68-46e0-ae07-dfb24a77be06.chart" . }}
{{ include "go-echoca1e0651-9d68-46e0-ae07-dfb24a77be06.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoca1e0651-9d68-46e0-ae07-dfb24a77be06.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoca1e0651-9d68-46e0-ae07-dfb24a77be06.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}