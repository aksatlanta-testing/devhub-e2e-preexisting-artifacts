
{{- define "go-echo6a697190-da5a-47e5-8520-8ff84ae5380e.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo6a697190-da5a-47e5-8520-8ff84ae5380e.fullname" -}}
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


{{- define "go-echo6a697190-da5a-47e5-8520-8ff84ae5380e.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo6a697190-da5a-47e5-8520-8ff84ae5380e.labels" -}}
helm.sh/chart: {{ include "go-echo6a697190-da5a-47e5-8520-8ff84ae5380e.chart" . }}
{{ include "go-echo6a697190-da5a-47e5-8520-8ff84ae5380e.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo6a697190-da5a-47e5-8520-8ff84ae5380e.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo6a697190-da5a-47e5-8520-8ff84ae5380e.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}