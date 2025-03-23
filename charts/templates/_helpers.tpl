
{{- define "go-echod42022c4-4769-436d-bee3-e0ec654e8bed.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod42022c4-4769-436d-bee3-e0ec654e8bed.fullname" -}}
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


{{- define "go-echod42022c4-4769-436d-bee3-e0ec654e8bed.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod42022c4-4769-436d-bee3-e0ec654e8bed.labels" -}}
helm.sh/chart: {{ include "go-echod42022c4-4769-436d-bee3-e0ec654e8bed.chart" . }}
{{ include "go-echod42022c4-4769-436d-bee3-e0ec654e8bed.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod42022c4-4769-436d-bee3-e0ec654e8bed.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod42022c4-4769-436d-bee3-e0ec654e8bed.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}