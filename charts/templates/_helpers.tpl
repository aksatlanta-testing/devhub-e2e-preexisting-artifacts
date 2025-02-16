
{{- define "go-echoca6b6fcf-50e1-471a-b63c-511afcc0a1ac.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoca6b6fcf-50e1-471a-b63c-511afcc0a1ac.fullname" -}}
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


{{- define "go-echoca6b6fcf-50e1-471a-b63c-511afcc0a1ac.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoca6b6fcf-50e1-471a-b63c-511afcc0a1ac.labels" -}}
helm.sh/chart: {{ include "go-echoca6b6fcf-50e1-471a-b63c-511afcc0a1ac.chart" . }}
{{ include "go-echoca6b6fcf-50e1-471a-b63c-511afcc0a1ac.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoca6b6fcf-50e1-471a-b63c-511afcc0a1ac.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoca6b6fcf-50e1-471a-b63c-511afcc0a1ac.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}