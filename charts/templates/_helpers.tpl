
{{- define "go-echo3b031fed-e925-4daa-b4d1-f4c711f218eb.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo3b031fed-e925-4daa-b4d1-f4c711f218eb.fullname" -}}
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


{{- define "go-echo3b031fed-e925-4daa-b4d1-f4c711f218eb.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo3b031fed-e925-4daa-b4d1-f4c711f218eb.labels" -}}
helm.sh/chart: {{ include "go-echo3b031fed-e925-4daa-b4d1-f4c711f218eb.chart" . }}
{{ include "go-echo3b031fed-e925-4daa-b4d1-f4c711f218eb.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo3b031fed-e925-4daa-b4d1-f4c711f218eb.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo3b031fed-e925-4daa-b4d1-f4c711f218eb.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}