
{{- define "go-echocdc471d0-f1f9-403d-b385-c3160ce61492.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocdc471d0-f1f9-403d-b385-c3160ce61492.fullname" -}}
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


{{- define "go-echocdc471d0-f1f9-403d-b385-c3160ce61492.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocdc471d0-f1f9-403d-b385-c3160ce61492.labels" -}}
helm.sh/chart: {{ include "go-echocdc471d0-f1f9-403d-b385-c3160ce61492.chart" . }}
{{ include "go-echocdc471d0-f1f9-403d-b385-c3160ce61492.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echocdc471d0-f1f9-403d-b385-c3160ce61492.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echocdc471d0-f1f9-403d-b385-c3160ce61492.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}