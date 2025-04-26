
{{- define "go-echo3c9469d6-7645-4eaf-b71f-d0c3e4fc4209.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo3c9469d6-7645-4eaf-b71f-d0c3e4fc4209.fullname" -}}
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


{{- define "go-echo3c9469d6-7645-4eaf-b71f-d0c3e4fc4209.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo3c9469d6-7645-4eaf-b71f-d0c3e4fc4209.labels" -}}
helm.sh/chart: {{ include "go-echo3c9469d6-7645-4eaf-b71f-d0c3e4fc4209.chart" . }}
{{ include "go-echo3c9469d6-7645-4eaf-b71f-d0c3e4fc4209.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo3c9469d6-7645-4eaf-b71f-d0c3e4fc4209.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo3c9469d6-7645-4eaf-b71f-d0c3e4fc4209.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}