
{{- define "go-echobdb1b507-e58f-4403-9f2d-50504cdd1840.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobdb1b507-e58f-4403-9f2d-50504cdd1840.fullname" -}}
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


{{- define "go-echobdb1b507-e58f-4403-9f2d-50504cdd1840.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobdb1b507-e58f-4403-9f2d-50504cdd1840.labels" -}}
helm.sh/chart: {{ include "go-echobdb1b507-e58f-4403-9f2d-50504cdd1840.chart" . }}
{{ include "go-echobdb1b507-e58f-4403-9f2d-50504cdd1840.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echobdb1b507-e58f-4403-9f2d-50504cdd1840.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echobdb1b507-e58f-4403-9f2d-50504cdd1840.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}