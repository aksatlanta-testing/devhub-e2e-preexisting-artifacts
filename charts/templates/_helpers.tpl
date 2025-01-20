
{{- define "go-echobc4af2d6-8c0c-4f02-a4ee-030abd28087f.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobc4af2d6-8c0c-4f02-a4ee-030abd28087f.fullname" -}}
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


{{- define "go-echobc4af2d6-8c0c-4f02-a4ee-030abd28087f.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobc4af2d6-8c0c-4f02-a4ee-030abd28087f.labels" -}}
helm.sh/chart: {{ include "go-echobc4af2d6-8c0c-4f02-a4ee-030abd28087f.chart" . }}
{{ include "go-echobc4af2d6-8c0c-4f02-a4ee-030abd28087f.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echobc4af2d6-8c0c-4f02-a4ee-030abd28087f.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echobc4af2d6-8c0c-4f02-a4ee-030abd28087f.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}