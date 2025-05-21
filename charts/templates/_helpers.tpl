
{{- define "go-echoe9d76717-ac4e-4a45-80c7-b47ac92a0a59.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe9d76717-ac4e-4a45-80c7-b47ac92a0a59.fullname" -}}
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


{{- define "go-echoe9d76717-ac4e-4a45-80c7-b47ac92a0a59.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe9d76717-ac4e-4a45-80c7-b47ac92a0a59.labels" -}}
helm.sh/chart: {{ include "go-echoe9d76717-ac4e-4a45-80c7-b47ac92a0a59.chart" . }}
{{ include "go-echoe9d76717-ac4e-4a45-80c7-b47ac92a0a59.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoe9d76717-ac4e-4a45-80c7-b47ac92a0a59.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoe9d76717-ac4e-4a45-80c7-b47ac92a0a59.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}