
{{- define "go-echo6db02b22-c098-4b0a-9927-2b40d5bb559a.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo6db02b22-c098-4b0a-9927-2b40d5bb559a.fullname" -}}
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


{{- define "go-echo6db02b22-c098-4b0a-9927-2b40d5bb559a.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo6db02b22-c098-4b0a-9927-2b40d5bb559a.labels" -}}
helm.sh/chart: {{ include "go-echo6db02b22-c098-4b0a-9927-2b40d5bb559a.chart" . }}
{{ include "go-echo6db02b22-c098-4b0a-9927-2b40d5bb559a.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo6db02b22-c098-4b0a-9927-2b40d5bb559a.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo6db02b22-c098-4b0a-9927-2b40d5bb559a.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}