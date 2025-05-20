
{{- define "go-echo404ca464-e99a-4de8-b7fb-cc20e17c47bb.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo404ca464-e99a-4de8-b7fb-cc20e17c47bb.fullname" -}}
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


{{- define "go-echo404ca464-e99a-4de8-b7fb-cc20e17c47bb.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo404ca464-e99a-4de8-b7fb-cc20e17c47bb.labels" -}}
helm.sh/chart: {{ include "go-echo404ca464-e99a-4de8-b7fb-cc20e17c47bb.chart" . }}
{{ include "go-echo404ca464-e99a-4de8-b7fb-cc20e17c47bb.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo404ca464-e99a-4de8-b7fb-cc20e17c47bb.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo404ca464-e99a-4de8-b7fb-cc20e17c47bb.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}