
{{- define "go-echoce86ff63-d5e6-4ecd-8e99-100b0867e0de.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoce86ff63-d5e6-4ecd-8e99-100b0867e0de.fullname" -}}
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


{{- define "go-echoce86ff63-d5e6-4ecd-8e99-100b0867e0de.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoce86ff63-d5e6-4ecd-8e99-100b0867e0de.labels" -}}
helm.sh/chart: {{ include "go-echoce86ff63-d5e6-4ecd-8e99-100b0867e0de.chart" . }}
{{ include "go-echoce86ff63-d5e6-4ecd-8e99-100b0867e0de.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoce86ff63-d5e6-4ecd-8e99-100b0867e0de.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoce86ff63-d5e6-4ecd-8e99-100b0867e0de.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}