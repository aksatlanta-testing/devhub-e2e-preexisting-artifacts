
{{- define "go-echo83ee0d1a-3664-49cc-a1b4-08c8a534b5fd.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo83ee0d1a-3664-49cc-a1b4-08c8a534b5fd.fullname" -}}
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


{{- define "go-echo83ee0d1a-3664-49cc-a1b4-08c8a534b5fd.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo83ee0d1a-3664-49cc-a1b4-08c8a534b5fd.labels" -}}
helm.sh/chart: {{ include "go-echo83ee0d1a-3664-49cc-a1b4-08c8a534b5fd.chart" . }}
{{ include "go-echo83ee0d1a-3664-49cc-a1b4-08c8a534b5fd.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo83ee0d1a-3664-49cc-a1b4-08c8a534b5fd.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo83ee0d1a-3664-49cc-a1b4-08c8a534b5fd.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}