
{{- define "go-echoad003ddd-2ea2-4679-81e7-d191fb4a74ed.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoad003ddd-2ea2-4679-81e7-d191fb4a74ed.fullname" -}}
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


{{- define "go-echoad003ddd-2ea2-4679-81e7-d191fb4a74ed.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoad003ddd-2ea2-4679-81e7-d191fb4a74ed.labels" -}}
helm.sh/chart: {{ include "go-echoad003ddd-2ea2-4679-81e7-d191fb4a74ed.chart" . }}
{{ include "go-echoad003ddd-2ea2-4679-81e7-d191fb4a74ed.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoad003ddd-2ea2-4679-81e7-d191fb4a74ed.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoad003ddd-2ea2-4679-81e7-d191fb4a74ed.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}