
{{- define "go-echo1a2fe73e-fcc5-4096-814e-b75e0e6f1a1d.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo1a2fe73e-fcc5-4096-814e-b75e0e6f1a1d.fullname" -}}
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


{{- define "go-echo1a2fe73e-fcc5-4096-814e-b75e0e6f1a1d.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo1a2fe73e-fcc5-4096-814e-b75e0e6f1a1d.labels" -}}
helm.sh/chart: {{ include "go-echo1a2fe73e-fcc5-4096-814e-b75e0e6f1a1d.chart" . }}
{{ include "go-echo1a2fe73e-fcc5-4096-814e-b75e0e6f1a1d.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo1a2fe73e-fcc5-4096-814e-b75e0e6f1a1d.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo1a2fe73e-fcc5-4096-814e-b75e0e6f1a1d.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}