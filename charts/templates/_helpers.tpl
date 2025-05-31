
{{- define "go-echobb0404ca-a59a-4b32-84ac-3c5fe270a79a.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobb0404ca-a59a-4b32-84ac-3c5fe270a79a.fullname" -}}
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


{{- define "go-echobb0404ca-a59a-4b32-84ac-3c5fe270a79a.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobb0404ca-a59a-4b32-84ac-3c5fe270a79a.labels" -}}
helm.sh/chart: {{ include "go-echobb0404ca-a59a-4b32-84ac-3c5fe270a79a.chart" . }}
{{ include "go-echobb0404ca-a59a-4b32-84ac-3c5fe270a79a.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echobb0404ca-a59a-4b32-84ac-3c5fe270a79a.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echobb0404ca-a59a-4b32-84ac-3c5fe270a79a.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}