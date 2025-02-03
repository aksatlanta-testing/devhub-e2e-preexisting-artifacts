
{{- define "go-echo2560a741-b0a6-4f82-8edb-c43a34d6656a.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo2560a741-b0a6-4f82-8edb-c43a34d6656a.fullname" -}}
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


{{- define "go-echo2560a741-b0a6-4f82-8edb-c43a34d6656a.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo2560a741-b0a6-4f82-8edb-c43a34d6656a.labels" -}}
helm.sh/chart: {{ include "go-echo2560a741-b0a6-4f82-8edb-c43a34d6656a.chart" . }}
{{ include "go-echo2560a741-b0a6-4f82-8edb-c43a34d6656a.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo2560a741-b0a6-4f82-8edb-c43a34d6656a.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo2560a741-b0a6-4f82-8edb-c43a34d6656a.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}