
{{- define "go-echo03154c61-2de6-42e8-a6f4-552424efad1d.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo03154c61-2de6-42e8-a6f4-552424efad1d.fullname" -}}
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


{{- define "go-echo03154c61-2de6-42e8-a6f4-552424efad1d.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo03154c61-2de6-42e8-a6f4-552424efad1d.labels" -}}
helm.sh/chart: {{ include "go-echo03154c61-2de6-42e8-a6f4-552424efad1d.chart" . }}
{{ include "go-echo03154c61-2de6-42e8-a6f4-552424efad1d.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo03154c61-2de6-42e8-a6f4-552424efad1d.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo03154c61-2de6-42e8-a6f4-552424efad1d.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}