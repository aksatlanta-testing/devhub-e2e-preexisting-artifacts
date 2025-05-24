
{{- define "go-echob04dcd2a-900a-4b73-8891-28ea0931255e.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob04dcd2a-900a-4b73-8891-28ea0931255e.fullname" -}}
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


{{- define "go-echob04dcd2a-900a-4b73-8891-28ea0931255e.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob04dcd2a-900a-4b73-8891-28ea0931255e.labels" -}}
helm.sh/chart: {{ include "go-echob04dcd2a-900a-4b73-8891-28ea0931255e.chart" . }}
{{ include "go-echob04dcd2a-900a-4b73-8891-28ea0931255e.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echob04dcd2a-900a-4b73-8891-28ea0931255e.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echob04dcd2a-900a-4b73-8891-28ea0931255e.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}