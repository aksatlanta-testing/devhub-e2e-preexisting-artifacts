
{{- define "go-echoaa5476c3-f0c1-4cd2-822e-217d7b5e3f5e.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoaa5476c3-f0c1-4cd2-822e-217d7b5e3f5e.fullname" -}}
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


{{- define "go-echoaa5476c3-f0c1-4cd2-822e-217d7b5e3f5e.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoaa5476c3-f0c1-4cd2-822e-217d7b5e3f5e.labels" -}}
helm.sh/chart: {{ include "go-echoaa5476c3-f0c1-4cd2-822e-217d7b5e3f5e.chart" . }}
{{ include "go-echoaa5476c3-f0c1-4cd2-822e-217d7b5e3f5e.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoaa5476c3-f0c1-4cd2-822e-217d7b5e3f5e.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoaa5476c3-f0c1-4cd2-822e-217d7b5e3f5e.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}