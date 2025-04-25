
{{- define "go-echo08272f60-d732-4ea1-9a7b-7db9e05a13ab.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo08272f60-d732-4ea1-9a7b-7db9e05a13ab.fullname" -}}
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


{{- define "go-echo08272f60-d732-4ea1-9a7b-7db9e05a13ab.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo08272f60-d732-4ea1-9a7b-7db9e05a13ab.labels" -}}
helm.sh/chart: {{ include "go-echo08272f60-d732-4ea1-9a7b-7db9e05a13ab.chart" . }}
{{ include "go-echo08272f60-d732-4ea1-9a7b-7db9e05a13ab.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo08272f60-d732-4ea1-9a7b-7db9e05a13ab.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo08272f60-d732-4ea1-9a7b-7db9e05a13ab.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}