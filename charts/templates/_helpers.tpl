
{{- define "go-echo5129dbf9-308c-46d2-85ec-db2ae21a3972.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo5129dbf9-308c-46d2-85ec-db2ae21a3972.fullname" -}}
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


{{- define "go-echo5129dbf9-308c-46d2-85ec-db2ae21a3972.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo5129dbf9-308c-46d2-85ec-db2ae21a3972.labels" -}}
helm.sh/chart: {{ include "go-echo5129dbf9-308c-46d2-85ec-db2ae21a3972.chart" . }}
{{ include "go-echo5129dbf9-308c-46d2-85ec-db2ae21a3972.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo5129dbf9-308c-46d2-85ec-db2ae21a3972.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo5129dbf9-308c-46d2-85ec-db2ae21a3972.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}