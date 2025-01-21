
{{- define "go-echof15546d8-37e9-4279-9d60-f1b14002b660.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof15546d8-37e9-4279-9d60-f1b14002b660.fullname" -}}
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


{{- define "go-echof15546d8-37e9-4279-9d60-f1b14002b660.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof15546d8-37e9-4279-9d60-f1b14002b660.labels" -}}
helm.sh/chart: {{ include "go-echof15546d8-37e9-4279-9d60-f1b14002b660.chart" . }}
{{ include "go-echof15546d8-37e9-4279-9d60-f1b14002b660.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof15546d8-37e9-4279-9d60-f1b14002b660.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof15546d8-37e9-4279-9d60-f1b14002b660.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}