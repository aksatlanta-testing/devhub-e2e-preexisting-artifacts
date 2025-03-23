
{{- define "go-echo32912d7a-9d3c-430c-9e7d-a134b1bfce74.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo32912d7a-9d3c-430c-9e7d-a134b1bfce74.fullname" -}}
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


{{- define "go-echo32912d7a-9d3c-430c-9e7d-a134b1bfce74.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo32912d7a-9d3c-430c-9e7d-a134b1bfce74.labels" -}}
helm.sh/chart: {{ include "go-echo32912d7a-9d3c-430c-9e7d-a134b1bfce74.chart" . }}
{{ include "go-echo32912d7a-9d3c-430c-9e7d-a134b1bfce74.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo32912d7a-9d3c-430c-9e7d-a134b1bfce74.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo32912d7a-9d3c-430c-9e7d-a134b1bfce74.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}