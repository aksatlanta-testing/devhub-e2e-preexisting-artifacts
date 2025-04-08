
{{- define "go-echoba75f875-a6d0-4fa3-adef-6a1b53fb5441.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoba75f875-a6d0-4fa3-adef-6a1b53fb5441.fullname" -}}
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


{{- define "go-echoba75f875-a6d0-4fa3-adef-6a1b53fb5441.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoba75f875-a6d0-4fa3-adef-6a1b53fb5441.labels" -}}
helm.sh/chart: {{ include "go-echoba75f875-a6d0-4fa3-adef-6a1b53fb5441.chart" . }}
{{ include "go-echoba75f875-a6d0-4fa3-adef-6a1b53fb5441.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoba75f875-a6d0-4fa3-adef-6a1b53fb5441.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoba75f875-a6d0-4fa3-adef-6a1b53fb5441.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}