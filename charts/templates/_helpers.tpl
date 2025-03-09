
{{- define "go-echo8f0e61ed-65ed-4796-a073-5f9e10189714.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo8f0e61ed-65ed-4796-a073-5f9e10189714.fullname" -}}
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


{{- define "go-echo8f0e61ed-65ed-4796-a073-5f9e10189714.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo8f0e61ed-65ed-4796-a073-5f9e10189714.labels" -}}
helm.sh/chart: {{ include "go-echo8f0e61ed-65ed-4796-a073-5f9e10189714.chart" . }}
{{ include "go-echo8f0e61ed-65ed-4796-a073-5f9e10189714.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo8f0e61ed-65ed-4796-a073-5f9e10189714.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo8f0e61ed-65ed-4796-a073-5f9e10189714.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}