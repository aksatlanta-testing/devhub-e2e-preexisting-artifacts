
{{- define "go-echod0b1c110-54e2-4e2b-95d5-cee6d5b1892b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod0b1c110-54e2-4e2b-95d5-cee6d5b1892b.fullname" -}}
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


{{- define "go-echod0b1c110-54e2-4e2b-95d5-cee6d5b1892b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod0b1c110-54e2-4e2b-95d5-cee6d5b1892b.labels" -}}
helm.sh/chart: {{ include "go-echod0b1c110-54e2-4e2b-95d5-cee6d5b1892b.chart" . }}
{{ include "go-echod0b1c110-54e2-4e2b-95d5-cee6d5b1892b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod0b1c110-54e2-4e2b-95d5-cee6d5b1892b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod0b1c110-54e2-4e2b-95d5-cee6d5b1892b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}