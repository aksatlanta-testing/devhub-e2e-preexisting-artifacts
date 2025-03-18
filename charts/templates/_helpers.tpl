
{{- define "go-echoff6e74d3-afde-4309-9533-1f3c23de29cf.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoff6e74d3-afde-4309-9533-1f3c23de29cf.fullname" -}}
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


{{- define "go-echoff6e74d3-afde-4309-9533-1f3c23de29cf.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoff6e74d3-afde-4309-9533-1f3c23de29cf.labels" -}}
helm.sh/chart: {{ include "go-echoff6e74d3-afde-4309-9533-1f3c23de29cf.chart" . }}
{{ include "go-echoff6e74d3-afde-4309-9533-1f3c23de29cf.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoff6e74d3-afde-4309-9533-1f3c23de29cf.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoff6e74d3-afde-4309-9533-1f3c23de29cf.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}