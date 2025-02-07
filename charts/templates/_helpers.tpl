
{{- define "go-echobdf7b10d-b370-4a0e-9f1b-29f4c20dee38.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobdf7b10d-b370-4a0e-9f1b-29f4c20dee38.fullname" -}}
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


{{- define "go-echobdf7b10d-b370-4a0e-9f1b-29f4c20dee38.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobdf7b10d-b370-4a0e-9f1b-29f4c20dee38.labels" -}}
helm.sh/chart: {{ include "go-echobdf7b10d-b370-4a0e-9f1b-29f4c20dee38.chart" . }}
{{ include "go-echobdf7b10d-b370-4a0e-9f1b-29f4c20dee38.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echobdf7b10d-b370-4a0e-9f1b-29f4c20dee38.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echobdf7b10d-b370-4a0e-9f1b-29f4c20dee38.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}