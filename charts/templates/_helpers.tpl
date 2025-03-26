
{{- define "go-echoff5a8e47-cc50-4d8c-8b09-17d758824d37.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoff5a8e47-cc50-4d8c-8b09-17d758824d37.fullname" -}}
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


{{- define "go-echoff5a8e47-cc50-4d8c-8b09-17d758824d37.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoff5a8e47-cc50-4d8c-8b09-17d758824d37.labels" -}}
helm.sh/chart: {{ include "go-echoff5a8e47-cc50-4d8c-8b09-17d758824d37.chart" . }}
{{ include "go-echoff5a8e47-cc50-4d8c-8b09-17d758824d37.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoff5a8e47-cc50-4d8c-8b09-17d758824d37.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoff5a8e47-cc50-4d8c-8b09-17d758824d37.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}