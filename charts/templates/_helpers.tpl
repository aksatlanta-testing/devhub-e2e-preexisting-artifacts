
{{- define "go-echo7c3a3fa5-b621-4432-bf6b-259ee8ce492b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo7c3a3fa5-b621-4432-bf6b-259ee8ce492b.fullname" -}}
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


{{- define "go-echo7c3a3fa5-b621-4432-bf6b-259ee8ce492b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo7c3a3fa5-b621-4432-bf6b-259ee8ce492b.labels" -}}
helm.sh/chart: {{ include "go-echo7c3a3fa5-b621-4432-bf6b-259ee8ce492b.chart" . }}
{{ include "go-echo7c3a3fa5-b621-4432-bf6b-259ee8ce492b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo7c3a3fa5-b621-4432-bf6b-259ee8ce492b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo7c3a3fa5-b621-4432-bf6b-259ee8ce492b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}