
{{- define "go-echod14080ab-717a-475a-9c0e-d701584c9715.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod14080ab-717a-475a-9c0e-d701584c9715.fullname" -}}
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


{{- define "go-echod14080ab-717a-475a-9c0e-d701584c9715.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod14080ab-717a-475a-9c0e-d701584c9715.labels" -}}
helm.sh/chart: {{ include "go-echod14080ab-717a-475a-9c0e-d701584c9715.chart" . }}
{{ include "go-echod14080ab-717a-475a-9c0e-d701584c9715.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod14080ab-717a-475a-9c0e-d701584c9715.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod14080ab-717a-475a-9c0e-d701584c9715.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}