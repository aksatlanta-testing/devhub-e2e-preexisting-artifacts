
{{- define "go-echo7d30f92d-1c78-4d30-bc16-2fe254a93faf.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo7d30f92d-1c78-4d30-bc16-2fe254a93faf.fullname" -}}
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


{{- define "go-echo7d30f92d-1c78-4d30-bc16-2fe254a93faf.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo7d30f92d-1c78-4d30-bc16-2fe254a93faf.labels" -}}
helm.sh/chart: {{ include "go-echo7d30f92d-1c78-4d30-bc16-2fe254a93faf.chart" . }}
{{ include "go-echo7d30f92d-1c78-4d30-bc16-2fe254a93faf.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo7d30f92d-1c78-4d30-bc16-2fe254a93faf.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo7d30f92d-1c78-4d30-bc16-2fe254a93faf.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}