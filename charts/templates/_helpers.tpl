
{{- define "go-echof8f568a1-f450-4e5b-a113-40094e485a9b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof8f568a1-f450-4e5b-a113-40094e485a9b.fullname" -}}
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


{{- define "go-echof8f568a1-f450-4e5b-a113-40094e485a9b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof8f568a1-f450-4e5b-a113-40094e485a9b.labels" -}}
helm.sh/chart: {{ include "go-echof8f568a1-f450-4e5b-a113-40094e485a9b.chart" . }}
{{ include "go-echof8f568a1-f450-4e5b-a113-40094e485a9b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof8f568a1-f450-4e5b-a113-40094e485a9b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof8f568a1-f450-4e5b-a113-40094e485a9b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}