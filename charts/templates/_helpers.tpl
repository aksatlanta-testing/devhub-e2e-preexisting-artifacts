
{{- define "go-echo8129ae57-930d-43df-8c13-7d754207c44d.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo8129ae57-930d-43df-8c13-7d754207c44d.fullname" -}}
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


{{- define "go-echo8129ae57-930d-43df-8c13-7d754207c44d.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo8129ae57-930d-43df-8c13-7d754207c44d.labels" -}}
helm.sh/chart: {{ include "go-echo8129ae57-930d-43df-8c13-7d754207c44d.chart" . }}
{{ include "go-echo8129ae57-930d-43df-8c13-7d754207c44d.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo8129ae57-930d-43df-8c13-7d754207c44d.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo8129ae57-930d-43df-8c13-7d754207c44d.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}