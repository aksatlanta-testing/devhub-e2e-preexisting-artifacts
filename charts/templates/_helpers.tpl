
{{- define "go-echo5adf349d-d1c4-4242-87df-8f30e35a043e.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo5adf349d-d1c4-4242-87df-8f30e35a043e.fullname" -}}
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


{{- define "go-echo5adf349d-d1c4-4242-87df-8f30e35a043e.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo5adf349d-d1c4-4242-87df-8f30e35a043e.labels" -}}
helm.sh/chart: {{ include "go-echo5adf349d-d1c4-4242-87df-8f30e35a043e.chart" . }}
{{ include "go-echo5adf349d-d1c4-4242-87df-8f30e35a043e.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo5adf349d-d1c4-4242-87df-8f30e35a043e.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo5adf349d-d1c4-4242-87df-8f30e35a043e.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}