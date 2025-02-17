
{{- define "go-echo615e9211-4760-4c6f-9e37-dcc070f0c8eb.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo615e9211-4760-4c6f-9e37-dcc070f0c8eb.fullname" -}}
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


{{- define "go-echo615e9211-4760-4c6f-9e37-dcc070f0c8eb.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo615e9211-4760-4c6f-9e37-dcc070f0c8eb.labels" -}}
helm.sh/chart: {{ include "go-echo615e9211-4760-4c6f-9e37-dcc070f0c8eb.chart" . }}
{{ include "go-echo615e9211-4760-4c6f-9e37-dcc070f0c8eb.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo615e9211-4760-4c6f-9e37-dcc070f0c8eb.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo615e9211-4760-4c6f-9e37-dcc070f0c8eb.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}