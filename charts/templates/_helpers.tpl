
{{- define "go-echoac6f0fa6-2726-4a58-88c0-1dd1d76f1a7f.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoac6f0fa6-2726-4a58-88c0-1dd1d76f1a7f.fullname" -}}
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


{{- define "go-echoac6f0fa6-2726-4a58-88c0-1dd1d76f1a7f.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoac6f0fa6-2726-4a58-88c0-1dd1d76f1a7f.labels" -}}
helm.sh/chart: {{ include "go-echoac6f0fa6-2726-4a58-88c0-1dd1d76f1a7f.chart" . }}
{{ include "go-echoac6f0fa6-2726-4a58-88c0-1dd1d76f1a7f.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoac6f0fa6-2726-4a58-88c0-1dd1d76f1a7f.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoac6f0fa6-2726-4a58-88c0-1dd1d76f1a7f.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}