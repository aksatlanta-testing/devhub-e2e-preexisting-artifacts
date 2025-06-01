
{{- define "go-echod361e121-405c-4b2e-bea0-2c056bd93221.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod361e121-405c-4b2e-bea0-2c056bd93221.fullname" -}}
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


{{- define "go-echod361e121-405c-4b2e-bea0-2c056bd93221.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod361e121-405c-4b2e-bea0-2c056bd93221.labels" -}}
helm.sh/chart: {{ include "go-echod361e121-405c-4b2e-bea0-2c056bd93221.chart" . }}
{{ include "go-echod361e121-405c-4b2e-bea0-2c056bd93221.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod361e121-405c-4b2e-bea0-2c056bd93221.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod361e121-405c-4b2e-bea0-2c056bd93221.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}