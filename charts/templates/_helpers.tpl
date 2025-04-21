
{{- define "go-echob5886053-c5b3-436f-950c-5ad85cbc46ce.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob5886053-c5b3-436f-950c-5ad85cbc46ce.fullname" -}}
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


{{- define "go-echob5886053-c5b3-436f-950c-5ad85cbc46ce.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob5886053-c5b3-436f-950c-5ad85cbc46ce.labels" -}}
helm.sh/chart: {{ include "go-echob5886053-c5b3-436f-950c-5ad85cbc46ce.chart" . }}
{{ include "go-echob5886053-c5b3-436f-950c-5ad85cbc46ce.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echob5886053-c5b3-436f-950c-5ad85cbc46ce.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echob5886053-c5b3-436f-950c-5ad85cbc46ce.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}