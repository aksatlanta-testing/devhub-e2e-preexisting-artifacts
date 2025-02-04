
{{- define "go-echo0da918c6-3906-47d3-b3a7-983a0c600dea.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo0da918c6-3906-47d3-b3a7-983a0c600dea.fullname" -}}
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


{{- define "go-echo0da918c6-3906-47d3-b3a7-983a0c600dea.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo0da918c6-3906-47d3-b3a7-983a0c600dea.labels" -}}
helm.sh/chart: {{ include "go-echo0da918c6-3906-47d3-b3a7-983a0c600dea.chart" . }}
{{ include "go-echo0da918c6-3906-47d3-b3a7-983a0c600dea.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo0da918c6-3906-47d3-b3a7-983a0c600dea.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo0da918c6-3906-47d3-b3a7-983a0c600dea.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}