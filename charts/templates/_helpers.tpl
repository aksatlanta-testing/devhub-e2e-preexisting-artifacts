
{{- define "go-echo12e97e2d-b5e6-45b9-b4a1-3ebf45bb4c91.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo12e97e2d-b5e6-45b9-b4a1-3ebf45bb4c91.fullname" -}}
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


{{- define "go-echo12e97e2d-b5e6-45b9-b4a1-3ebf45bb4c91.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo12e97e2d-b5e6-45b9-b4a1-3ebf45bb4c91.labels" -}}
helm.sh/chart: {{ include "go-echo12e97e2d-b5e6-45b9-b4a1-3ebf45bb4c91.chart" . }}
{{ include "go-echo12e97e2d-b5e6-45b9-b4a1-3ebf45bb4c91.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo12e97e2d-b5e6-45b9-b4a1-3ebf45bb4c91.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo12e97e2d-b5e6-45b9-b4a1-3ebf45bb4c91.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}