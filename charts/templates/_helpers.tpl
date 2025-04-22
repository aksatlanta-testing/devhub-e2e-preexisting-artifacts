
{{- define "go-echo3f849b5c-3c54-4712-96eb-b3e7ad84fafe.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo3f849b5c-3c54-4712-96eb-b3e7ad84fafe.fullname" -}}
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


{{- define "go-echo3f849b5c-3c54-4712-96eb-b3e7ad84fafe.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo3f849b5c-3c54-4712-96eb-b3e7ad84fafe.labels" -}}
helm.sh/chart: {{ include "go-echo3f849b5c-3c54-4712-96eb-b3e7ad84fafe.chart" . }}
{{ include "go-echo3f849b5c-3c54-4712-96eb-b3e7ad84fafe.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo3f849b5c-3c54-4712-96eb-b3e7ad84fafe.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo3f849b5c-3c54-4712-96eb-b3e7ad84fafe.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}