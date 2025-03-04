
{{- define "go-echobdeb9661-6663-49b8-8a7f-71585b5d5292.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobdeb9661-6663-49b8-8a7f-71585b5d5292.fullname" -}}
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


{{- define "go-echobdeb9661-6663-49b8-8a7f-71585b5d5292.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobdeb9661-6663-49b8-8a7f-71585b5d5292.labels" -}}
helm.sh/chart: {{ include "go-echobdeb9661-6663-49b8-8a7f-71585b5d5292.chart" . }}
{{ include "go-echobdeb9661-6663-49b8-8a7f-71585b5d5292.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echobdeb9661-6663-49b8-8a7f-71585b5d5292.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echobdeb9661-6663-49b8-8a7f-71585b5d5292.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}