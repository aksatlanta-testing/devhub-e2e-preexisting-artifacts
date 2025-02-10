
{{- define "go-echoc67419e9-e60e-4034-ba61-4fcf64b3ea28.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc67419e9-e60e-4034-ba61-4fcf64b3ea28.fullname" -}}
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


{{- define "go-echoc67419e9-e60e-4034-ba61-4fcf64b3ea28.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc67419e9-e60e-4034-ba61-4fcf64b3ea28.labels" -}}
helm.sh/chart: {{ include "go-echoc67419e9-e60e-4034-ba61-4fcf64b3ea28.chart" . }}
{{ include "go-echoc67419e9-e60e-4034-ba61-4fcf64b3ea28.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoc67419e9-e60e-4034-ba61-4fcf64b3ea28.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoc67419e9-e60e-4034-ba61-4fcf64b3ea28.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}