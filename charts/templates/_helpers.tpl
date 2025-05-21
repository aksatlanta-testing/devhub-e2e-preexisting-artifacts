
{{- define "go-echof27a5f47-a080-4c38-88f2-5fa6be2bed7b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof27a5f47-a080-4c38-88f2-5fa6be2bed7b.fullname" -}}
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


{{- define "go-echof27a5f47-a080-4c38-88f2-5fa6be2bed7b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof27a5f47-a080-4c38-88f2-5fa6be2bed7b.labels" -}}
helm.sh/chart: {{ include "go-echof27a5f47-a080-4c38-88f2-5fa6be2bed7b.chart" . }}
{{ include "go-echof27a5f47-a080-4c38-88f2-5fa6be2bed7b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof27a5f47-a080-4c38-88f2-5fa6be2bed7b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof27a5f47-a080-4c38-88f2-5fa6be2bed7b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}