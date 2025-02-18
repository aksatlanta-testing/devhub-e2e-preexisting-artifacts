
{{- define "go-echo9d62fb1d-da8a-4c9e-b5ba-2736d99bc0fb.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo9d62fb1d-da8a-4c9e-b5ba-2736d99bc0fb.fullname" -}}
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


{{- define "go-echo9d62fb1d-da8a-4c9e-b5ba-2736d99bc0fb.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo9d62fb1d-da8a-4c9e-b5ba-2736d99bc0fb.labels" -}}
helm.sh/chart: {{ include "go-echo9d62fb1d-da8a-4c9e-b5ba-2736d99bc0fb.chart" . }}
{{ include "go-echo9d62fb1d-da8a-4c9e-b5ba-2736d99bc0fb.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo9d62fb1d-da8a-4c9e-b5ba-2736d99bc0fb.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo9d62fb1d-da8a-4c9e-b5ba-2736d99bc0fb.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}