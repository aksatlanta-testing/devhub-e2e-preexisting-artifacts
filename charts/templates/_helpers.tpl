
{{- define "go-echo2cd59bc2-042e-4ca6-8281-36a72518ffec.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo2cd59bc2-042e-4ca6-8281-36a72518ffec.fullname" -}}
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


{{- define "go-echo2cd59bc2-042e-4ca6-8281-36a72518ffec.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo2cd59bc2-042e-4ca6-8281-36a72518ffec.labels" -}}
helm.sh/chart: {{ include "go-echo2cd59bc2-042e-4ca6-8281-36a72518ffec.chart" . }}
{{ include "go-echo2cd59bc2-042e-4ca6-8281-36a72518ffec.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo2cd59bc2-042e-4ca6-8281-36a72518ffec.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo2cd59bc2-042e-4ca6-8281-36a72518ffec.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}