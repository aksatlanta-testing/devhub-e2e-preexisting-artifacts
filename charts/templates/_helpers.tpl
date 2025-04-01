
{{- define "go-echoca6a08f9-0d94-4ad2-b977-4b3d72af17ca.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoca6a08f9-0d94-4ad2-b977-4b3d72af17ca.fullname" -}}
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


{{- define "go-echoca6a08f9-0d94-4ad2-b977-4b3d72af17ca.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoca6a08f9-0d94-4ad2-b977-4b3d72af17ca.labels" -}}
helm.sh/chart: {{ include "go-echoca6a08f9-0d94-4ad2-b977-4b3d72af17ca.chart" . }}
{{ include "go-echoca6a08f9-0d94-4ad2-b977-4b3d72af17ca.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoca6a08f9-0d94-4ad2-b977-4b3d72af17ca.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoca6a08f9-0d94-4ad2-b977-4b3d72af17ca.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}