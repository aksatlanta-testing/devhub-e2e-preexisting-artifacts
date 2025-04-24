
{{- define "go-echobeeb21e3-eaf8-4687-836d-2d2a150c045d.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobeeb21e3-eaf8-4687-836d-2d2a150c045d.fullname" -}}
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


{{- define "go-echobeeb21e3-eaf8-4687-836d-2d2a150c045d.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobeeb21e3-eaf8-4687-836d-2d2a150c045d.labels" -}}
helm.sh/chart: {{ include "go-echobeeb21e3-eaf8-4687-836d-2d2a150c045d.chart" . }}
{{ include "go-echobeeb21e3-eaf8-4687-836d-2d2a150c045d.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echobeeb21e3-eaf8-4687-836d-2d2a150c045d.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echobeeb21e3-eaf8-4687-836d-2d2a150c045d.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}