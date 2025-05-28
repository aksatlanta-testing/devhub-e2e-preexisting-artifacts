
{{- define "go-echo837f7871-91cb-4c49-973c-2760ff0b8dde.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo837f7871-91cb-4c49-973c-2760ff0b8dde.fullname" -}}
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


{{- define "go-echo837f7871-91cb-4c49-973c-2760ff0b8dde.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo837f7871-91cb-4c49-973c-2760ff0b8dde.labels" -}}
helm.sh/chart: {{ include "go-echo837f7871-91cb-4c49-973c-2760ff0b8dde.chart" . }}
{{ include "go-echo837f7871-91cb-4c49-973c-2760ff0b8dde.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo837f7871-91cb-4c49-973c-2760ff0b8dde.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo837f7871-91cb-4c49-973c-2760ff0b8dde.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}