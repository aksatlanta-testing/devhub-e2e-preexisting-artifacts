
{{- define "go-echoad5352d7-c3eb-4dac-94ca-1d6b1ff85c90.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoad5352d7-c3eb-4dac-94ca-1d6b1ff85c90.fullname" -}}
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


{{- define "go-echoad5352d7-c3eb-4dac-94ca-1d6b1ff85c90.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoad5352d7-c3eb-4dac-94ca-1d6b1ff85c90.labels" -}}
helm.sh/chart: {{ include "go-echoad5352d7-c3eb-4dac-94ca-1d6b1ff85c90.chart" . }}
{{ include "go-echoad5352d7-c3eb-4dac-94ca-1d6b1ff85c90.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoad5352d7-c3eb-4dac-94ca-1d6b1ff85c90.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoad5352d7-c3eb-4dac-94ca-1d6b1ff85c90.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}