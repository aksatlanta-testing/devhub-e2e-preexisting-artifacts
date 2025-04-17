
{{- define "go-echo16baa7e6-3d40-44c5-9227-c6e5d2742f0f.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo16baa7e6-3d40-44c5-9227-c6e5d2742f0f.fullname" -}}
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


{{- define "go-echo16baa7e6-3d40-44c5-9227-c6e5d2742f0f.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo16baa7e6-3d40-44c5-9227-c6e5d2742f0f.labels" -}}
helm.sh/chart: {{ include "go-echo16baa7e6-3d40-44c5-9227-c6e5d2742f0f.chart" . }}
{{ include "go-echo16baa7e6-3d40-44c5-9227-c6e5d2742f0f.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo16baa7e6-3d40-44c5-9227-c6e5d2742f0f.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo16baa7e6-3d40-44c5-9227-c6e5d2742f0f.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}