
{{- define "go-echobfbc0c58-4840-48c5-83c8-c6b8bb3e6098.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobfbc0c58-4840-48c5-83c8-c6b8bb3e6098.fullname" -}}
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


{{- define "go-echobfbc0c58-4840-48c5-83c8-c6b8bb3e6098.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobfbc0c58-4840-48c5-83c8-c6b8bb3e6098.labels" -}}
helm.sh/chart: {{ include "go-echobfbc0c58-4840-48c5-83c8-c6b8bb3e6098.chart" . }}
{{ include "go-echobfbc0c58-4840-48c5-83c8-c6b8bb3e6098.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echobfbc0c58-4840-48c5-83c8-c6b8bb3e6098.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echobfbc0c58-4840-48c5-83c8-c6b8bb3e6098.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}