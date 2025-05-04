
{{- define "go-echof32d4f7e-e1b0-4f3c-96c9-3e035d6ca951.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof32d4f7e-e1b0-4f3c-96c9-3e035d6ca951.fullname" -}}
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


{{- define "go-echof32d4f7e-e1b0-4f3c-96c9-3e035d6ca951.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof32d4f7e-e1b0-4f3c-96c9-3e035d6ca951.labels" -}}
helm.sh/chart: {{ include "go-echof32d4f7e-e1b0-4f3c-96c9-3e035d6ca951.chart" . }}
{{ include "go-echof32d4f7e-e1b0-4f3c-96c9-3e035d6ca951.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof32d4f7e-e1b0-4f3c-96c9-3e035d6ca951.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof32d4f7e-e1b0-4f3c-96c9-3e035d6ca951.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}