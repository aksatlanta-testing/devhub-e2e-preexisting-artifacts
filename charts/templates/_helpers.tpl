
{{- define "go-echo6f39dab2-9c72-4bdc-9b89-2ac16ca3237e.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo6f39dab2-9c72-4bdc-9b89-2ac16ca3237e.fullname" -}}
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


{{- define "go-echo6f39dab2-9c72-4bdc-9b89-2ac16ca3237e.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo6f39dab2-9c72-4bdc-9b89-2ac16ca3237e.labels" -}}
helm.sh/chart: {{ include "go-echo6f39dab2-9c72-4bdc-9b89-2ac16ca3237e.chart" . }}
{{ include "go-echo6f39dab2-9c72-4bdc-9b89-2ac16ca3237e.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo6f39dab2-9c72-4bdc-9b89-2ac16ca3237e.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo6f39dab2-9c72-4bdc-9b89-2ac16ca3237e.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}