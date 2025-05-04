
{{- define "go-echod4a8a5c8-8255-4fe5-aeee-28a6f0a959dc.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod4a8a5c8-8255-4fe5-aeee-28a6f0a959dc.fullname" -}}
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


{{- define "go-echod4a8a5c8-8255-4fe5-aeee-28a6f0a959dc.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod4a8a5c8-8255-4fe5-aeee-28a6f0a959dc.labels" -}}
helm.sh/chart: {{ include "go-echod4a8a5c8-8255-4fe5-aeee-28a6f0a959dc.chart" . }}
{{ include "go-echod4a8a5c8-8255-4fe5-aeee-28a6f0a959dc.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod4a8a5c8-8255-4fe5-aeee-28a6f0a959dc.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod4a8a5c8-8255-4fe5-aeee-28a6f0a959dc.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}