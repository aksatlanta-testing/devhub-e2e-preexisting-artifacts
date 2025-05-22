
{{- define "go-echobb54e074-0c32-4fda-8970-5be792fd92aa.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobb54e074-0c32-4fda-8970-5be792fd92aa.fullname" -}}
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


{{- define "go-echobb54e074-0c32-4fda-8970-5be792fd92aa.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobb54e074-0c32-4fda-8970-5be792fd92aa.labels" -}}
helm.sh/chart: {{ include "go-echobb54e074-0c32-4fda-8970-5be792fd92aa.chart" . }}
{{ include "go-echobb54e074-0c32-4fda-8970-5be792fd92aa.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echobb54e074-0c32-4fda-8970-5be792fd92aa.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echobb54e074-0c32-4fda-8970-5be792fd92aa.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}