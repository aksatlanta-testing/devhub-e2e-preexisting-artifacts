
{{- define "go-echo01aba666-a388-458e-9c8c-c20a19f100fc.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo01aba666-a388-458e-9c8c-c20a19f100fc.fullname" -}}
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


{{- define "go-echo01aba666-a388-458e-9c8c-c20a19f100fc.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo01aba666-a388-458e-9c8c-c20a19f100fc.labels" -}}
helm.sh/chart: {{ include "go-echo01aba666-a388-458e-9c8c-c20a19f100fc.chart" . }}
{{ include "go-echo01aba666-a388-458e-9c8c-c20a19f100fc.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo01aba666-a388-458e-9c8c-c20a19f100fc.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo01aba666-a388-458e-9c8c-c20a19f100fc.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}