
{{- define "go-echod4aa12e8-e549-4d5c-ab75-2679ff6fc69e.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod4aa12e8-e549-4d5c-ab75-2679ff6fc69e.fullname" -}}
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


{{- define "go-echod4aa12e8-e549-4d5c-ab75-2679ff6fc69e.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod4aa12e8-e549-4d5c-ab75-2679ff6fc69e.labels" -}}
helm.sh/chart: {{ include "go-echod4aa12e8-e549-4d5c-ab75-2679ff6fc69e.chart" . }}
{{ include "go-echod4aa12e8-e549-4d5c-ab75-2679ff6fc69e.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod4aa12e8-e549-4d5c-ab75-2679ff6fc69e.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod4aa12e8-e549-4d5c-ab75-2679ff6fc69e.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}