
{{- define "go-echofd9e04c1-3c87-4ab0-a6e6-aaa6fdbb567f.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofd9e04c1-3c87-4ab0-a6e6-aaa6fdbb567f.fullname" -}}
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


{{- define "go-echofd9e04c1-3c87-4ab0-a6e6-aaa6fdbb567f.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofd9e04c1-3c87-4ab0-a6e6-aaa6fdbb567f.labels" -}}
helm.sh/chart: {{ include "go-echofd9e04c1-3c87-4ab0-a6e6-aaa6fdbb567f.chart" . }}
{{ include "go-echofd9e04c1-3c87-4ab0-a6e6-aaa6fdbb567f.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echofd9e04c1-3c87-4ab0-a6e6-aaa6fdbb567f.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echofd9e04c1-3c87-4ab0-a6e6-aaa6fdbb567f.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}