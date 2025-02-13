
{{- define "go-echoc10c0d89-86d9-40e1-84d7-d5c6c7ccea17.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc10c0d89-86d9-40e1-84d7-d5c6c7ccea17.fullname" -}}
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


{{- define "go-echoc10c0d89-86d9-40e1-84d7-d5c6c7ccea17.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc10c0d89-86d9-40e1-84d7-d5c6c7ccea17.labels" -}}
helm.sh/chart: {{ include "go-echoc10c0d89-86d9-40e1-84d7-d5c6c7ccea17.chart" . }}
{{ include "go-echoc10c0d89-86d9-40e1-84d7-d5c6c7ccea17.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoc10c0d89-86d9-40e1-84d7-d5c6c7ccea17.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoc10c0d89-86d9-40e1-84d7-d5c6c7ccea17.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}