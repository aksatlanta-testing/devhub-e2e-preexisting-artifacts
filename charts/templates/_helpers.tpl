
{{- define "go-echo7de704b1-ea3a-4b88-9220-bfbbfa84c715.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo7de704b1-ea3a-4b88-9220-bfbbfa84c715.fullname" -}}
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


{{- define "go-echo7de704b1-ea3a-4b88-9220-bfbbfa84c715.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo7de704b1-ea3a-4b88-9220-bfbbfa84c715.labels" -}}
helm.sh/chart: {{ include "go-echo7de704b1-ea3a-4b88-9220-bfbbfa84c715.chart" . }}
{{ include "go-echo7de704b1-ea3a-4b88-9220-bfbbfa84c715.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo7de704b1-ea3a-4b88-9220-bfbbfa84c715.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo7de704b1-ea3a-4b88-9220-bfbbfa84c715.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}