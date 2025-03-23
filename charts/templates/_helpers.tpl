
{{- define "go-echo40ce3a0e-5199-47f5-95a5-ee388d3ac553.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo40ce3a0e-5199-47f5-95a5-ee388d3ac553.fullname" -}}
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


{{- define "go-echo40ce3a0e-5199-47f5-95a5-ee388d3ac553.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo40ce3a0e-5199-47f5-95a5-ee388d3ac553.labels" -}}
helm.sh/chart: {{ include "go-echo40ce3a0e-5199-47f5-95a5-ee388d3ac553.chart" . }}
{{ include "go-echo40ce3a0e-5199-47f5-95a5-ee388d3ac553.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo40ce3a0e-5199-47f5-95a5-ee388d3ac553.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo40ce3a0e-5199-47f5-95a5-ee388d3ac553.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}