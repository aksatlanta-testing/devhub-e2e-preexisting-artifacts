
{{- define "go-echo3a27406d-3368-4854-8565-06ae2d43cbfb.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo3a27406d-3368-4854-8565-06ae2d43cbfb.fullname" -}}
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


{{- define "go-echo3a27406d-3368-4854-8565-06ae2d43cbfb.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo3a27406d-3368-4854-8565-06ae2d43cbfb.labels" -}}
helm.sh/chart: {{ include "go-echo3a27406d-3368-4854-8565-06ae2d43cbfb.chart" . }}
{{ include "go-echo3a27406d-3368-4854-8565-06ae2d43cbfb.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo3a27406d-3368-4854-8565-06ae2d43cbfb.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo3a27406d-3368-4854-8565-06ae2d43cbfb.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}