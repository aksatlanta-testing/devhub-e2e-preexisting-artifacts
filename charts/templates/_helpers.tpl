
{{- define "go-echoa9048da6-ddae-4d93-bde5-8b2f674a4936.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa9048da6-ddae-4d93-bde5-8b2f674a4936.fullname" -}}
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


{{- define "go-echoa9048da6-ddae-4d93-bde5-8b2f674a4936.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa9048da6-ddae-4d93-bde5-8b2f674a4936.labels" -}}
helm.sh/chart: {{ include "go-echoa9048da6-ddae-4d93-bde5-8b2f674a4936.chart" . }}
{{ include "go-echoa9048da6-ddae-4d93-bde5-8b2f674a4936.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa9048da6-ddae-4d93-bde5-8b2f674a4936.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa9048da6-ddae-4d93-bde5-8b2f674a4936.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}