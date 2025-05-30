
{{- define "go-echo287dc8d3-a9fe-4102-95f0-2a84ae8938df.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo287dc8d3-a9fe-4102-95f0-2a84ae8938df.fullname" -}}
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


{{- define "go-echo287dc8d3-a9fe-4102-95f0-2a84ae8938df.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo287dc8d3-a9fe-4102-95f0-2a84ae8938df.labels" -}}
helm.sh/chart: {{ include "go-echo287dc8d3-a9fe-4102-95f0-2a84ae8938df.chart" . }}
{{ include "go-echo287dc8d3-a9fe-4102-95f0-2a84ae8938df.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo287dc8d3-a9fe-4102-95f0-2a84ae8938df.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo287dc8d3-a9fe-4102-95f0-2a84ae8938df.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}