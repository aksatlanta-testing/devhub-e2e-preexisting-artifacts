
{{- define "go-echod162c2b3-5c8b-431a-9106-1b52038b3430.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod162c2b3-5c8b-431a-9106-1b52038b3430.fullname" -}}
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


{{- define "go-echod162c2b3-5c8b-431a-9106-1b52038b3430.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod162c2b3-5c8b-431a-9106-1b52038b3430.labels" -}}
helm.sh/chart: {{ include "go-echod162c2b3-5c8b-431a-9106-1b52038b3430.chart" . }}
{{ include "go-echod162c2b3-5c8b-431a-9106-1b52038b3430.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod162c2b3-5c8b-431a-9106-1b52038b3430.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod162c2b3-5c8b-431a-9106-1b52038b3430.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}