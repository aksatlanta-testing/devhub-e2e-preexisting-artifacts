
{{- define "go-echo8bab7a73-4680-4020-b979-2af5dd9c78ff.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo8bab7a73-4680-4020-b979-2af5dd9c78ff.fullname" -}}
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


{{- define "go-echo8bab7a73-4680-4020-b979-2af5dd9c78ff.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo8bab7a73-4680-4020-b979-2af5dd9c78ff.labels" -}}
helm.sh/chart: {{ include "go-echo8bab7a73-4680-4020-b979-2af5dd9c78ff.chart" . }}
{{ include "go-echo8bab7a73-4680-4020-b979-2af5dd9c78ff.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo8bab7a73-4680-4020-b979-2af5dd9c78ff.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo8bab7a73-4680-4020-b979-2af5dd9c78ff.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}