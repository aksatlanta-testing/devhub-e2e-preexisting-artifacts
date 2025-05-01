
{{- define "go-echo27d78076-7f15-49b4-b4cf-e31fbcf1884b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo27d78076-7f15-49b4-b4cf-e31fbcf1884b.fullname" -}}
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


{{- define "go-echo27d78076-7f15-49b4-b4cf-e31fbcf1884b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo27d78076-7f15-49b4-b4cf-e31fbcf1884b.labels" -}}
helm.sh/chart: {{ include "go-echo27d78076-7f15-49b4-b4cf-e31fbcf1884b.chart" . }}
{{ include "go-echo27d78076-7f15-49b4-b4cf-e31fbcf1884b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo27d78076-7f15-49b4-b4cf-e31fbcf1884b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo27d78076-7f15-49b4-b4cf-e31fbcf1884b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}