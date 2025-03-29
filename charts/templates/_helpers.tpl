
{{- define "go-echo41eadad8-6f2e-433b-80be-9b67803ec92a.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo41eadad8-6f2e-433b-80be-9b67803ec92a.fullname" -}}
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


{{- define "go-echo41eadad8-6f2e-433b-80be-9b67803ec92a.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo41eadad8-6f2e-433b-80be-9b67803ec92a.labels" -}}
helm.sh/chart: {{ include "go-echo41eadad8-6f2e-433b-80be-9b67803ec92a.chart" . }}
{{ include "go-echo41eadad8-6f2e-433b-80be-9b67803ec92a.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo41eadad8-6f2e-433b-80be-9b67803ec92a.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo41eadad8-6f2e-433b-80be-9b67803ec92a.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}