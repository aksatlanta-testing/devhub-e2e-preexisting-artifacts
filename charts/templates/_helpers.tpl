
{{- define "go-echob88f6b96-ac5f-44a3-99ca-2e0cf5817e29.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob88f6b96-ac5f-44a3-99ca-2e0cf5817e29.fullname" -}}
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


{{- define "go-echob88f6b96-ac5f-44a3-99ca-2e0cf5817e29.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob88f6b96-ac5f-44a3-99ca-2e0cf5817e29.labels" -}}
helm.sh/chart: {{ include "go-echob88f6b96-ac5f-44a3-99ca-2e0cf5817e29.chart" . }}
{{ include "go-echob88f6b96-ac5f-44a3-99ca-2e0cf5817e29.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echob88f6b96-ac5f-44a3-99ca-2e0cf5817e29.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echob88f6b96-ac5f-44a3-99ca-2e0cf5817e29.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}