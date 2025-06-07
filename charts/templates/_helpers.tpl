
{{- define "go-echo32505399-f7d7-4642-9968-36b6a5c9c95b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo32505399-f7d7-4642-9968-36b6a5c9c95b.fullname" -}}
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


{{- define "go-echo32505399-f7d7-4642-9968-36b6a5c9c95b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo32505399-f7d7-4642-9968-36b6a5c9c95b.labels" -}}
helm.sh/chart: {{ include "go-echo32505399-f7d7-4642-9968-36b6a5c9c95b.chart" . }}
{{ include "go-echo32505399-f7d7-4642-9968-36b6a5c9c95b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo32505399-f7d7-4642-9968-36b6a5c9c95b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo32505399-f7d7-4642-9968-36b6a5c9c95b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}