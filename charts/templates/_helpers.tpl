
{{- define "go-echo10395211-60bb-42a4-bd0d-2faa6bdd406a.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo10395211-60bb-42a4-bd0d-2faa6bdd406a.fullname" -}}
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


{{- define "go-echo10395211-60bb-42a4-bd0d-2faa6bdd406a.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo10395211-60bb-42a4-bd0d-2faa6bdd406a.labels" -}}
helm.sh/chart: {{ include "go-echo10395211-60bb-42a4-bd0d-2faa6bdd406a.chart" . }}
{{ include "go-echo10395211-60bb-42a4-bd0d-2faa6bdd406a.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo10395211-60bb-42a4-bd0d-2faa6bdd406a.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo10395211-60bb-42a4-bd0d-2faa6bdd406a.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}