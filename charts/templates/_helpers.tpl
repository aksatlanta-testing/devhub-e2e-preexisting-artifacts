
{{- define "go-echo9121079f-e9f1-4657-885a-3f481a8cb1fa.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo9121079f-e9f1-4657-885a-3f481a8cb1fa.fullname" -}}
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


{{- define "go-echo9121079f-e9f1-4657-885a-3f481a8cb1fa.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo9121079f-e9f1-4657-885a-3f481a8cb1fa.labels" -}}
helm.sh/chart: {{ include "go-echo9121079f-e9f1-4657-885a-3f481a8cb1fa.chart" . }}
{{ include "go-echo9121079f-e9f1-4657-885a-3f481a8cb1fa.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo9121079f-e9f1-4657-885a-3f481a8cb1fa.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo9121079f-e9f1-4657-885a-3f481a8cb1fa.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}