
{{- define "go-echo9d9ccc2e-08e5-4480-b044-0bdb3b370952.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo9d9ccc2e-08e5-4480-b044-0bdb3b370952.fullname" -}}
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


{{- define "go-echo9d9ccc2e-08e5-4480-b044-0bdb3b370952.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo9d9ccc2e-08e5-4480-b044-0bdb3b370952.labels" -}}
helm.sh/chart: {{ include "go-echo9d9ccc2e-08e5-4480-b044-0bdb3b370952.chart" . }}
{{ include "go-echo9d9ccc2e-08e5-4480-b044-0bdb3b370952.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo9d9ccc2e-08e5-4480-b044-0bdb3b370952.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo9d9ccc2e-08e5-4480-b044-0bdb3b370952.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}