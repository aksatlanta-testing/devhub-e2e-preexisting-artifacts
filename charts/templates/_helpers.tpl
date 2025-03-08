
{{- define "go-echoa79e69a1-0cb7-40fd-ac52-8ff6576ca6ac.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa79e69a1-0cb7-40fd-ac52-8ff6576ca6ac.fullname" -}}
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


{{- define "go-echoa79e69a1-0cb7-40fd-ac52-8ff6576ca6ac.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa79e69a1-0cb7-40fd-ac52-8ff6576ca6ac.labels" -}}
helm.sh/chart: {{ include "go-echoa79e69a1-0cb7-40fd-ac52-8ff6576ca6ac.chart" . }}
{{ include "go-echoa79e69a1-0cb7-40fd-ac52-8ff6576ca6ac.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa79e69a1-0cb7-40fd-ac52-8ff6576ca6ac.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa79e69a1-0cb7-40fd-ac52-8ff6576ca6ac.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}