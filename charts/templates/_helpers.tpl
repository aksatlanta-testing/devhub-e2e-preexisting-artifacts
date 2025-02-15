
{{- define "go-echoa648b5c0-7e84-44fc-a257-35d35894f7bd.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa648b5c0-7e84-44fc-a257-35d35894f7bd.fullname" -}}
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


{{- define "go-echoa648b5c0-7e84-44fc-a257-35d35894f7bd.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa648b5c0-7e84-44fc-a257-35d35894f7bd.labels" -}}
helm.sh/chart: {{ include "go-echoa648b5c0-7e84-44fc-a257-35d35894f7bd.chart" . }}
{{ include "go-echoa648b5c0-7e84-44fc-a257-35d35894f7bd.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa648b5c0-7e84-44fc-a257-35d35894f7bd.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa648b5c0-7e84-44fc-a257-35d35894f7bd.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}