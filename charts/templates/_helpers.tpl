
{{- define "go-echoa04a7bf0-e908-4107-a652-968005308def.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa04a7bf0-e908-4107-a652-968005308def.fullname" -}}
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


{{- define "go-echoa04a7bf0-e908-4107-a652-968005308def.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa04a7bf0-e908-4107-a652-968005308def.labels" -}}
helm.sh/chart: {{ include "go-echoa04a7bf0-e908-4107-a652-968005308def.chart" . }}
{{ include "go-echoa04a7bf0-e908-4107-a652-968005308def.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa04a7bf0-e908-4107-a652-968005308def.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa04a7bf0-e908-4107-a652-968005308def.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}