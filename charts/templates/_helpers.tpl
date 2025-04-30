
{{- define "go-echo08d678a8-8bac-4fcd-9c6e-90617cb69deb.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo08d678a8-8bac-4fcd-9c6e-90617cb69deb.fullname" -}}
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


{{- define "go-echo08d678a8-8bac-4fcd-9c6e-90617cb69deb.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo08d678a8-8bac-4fcd-9c6e-90617cb69deb.labels" -}}
helm.sh/chart: {{ include "go-echo08d678a8-8bac-4fcd-9c6e-90617cb69deb.chart" . }}
{{ include "go-echo08d678a8-8bac-4fcd-9c6e-90617cb69deb.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo08d678a8-8bac-4fcd-9c6e-90617cb69deb.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo08d678a8-8bac-4fcd-9c6e-90617cb69deb.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}