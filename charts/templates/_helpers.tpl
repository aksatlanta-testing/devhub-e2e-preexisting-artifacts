
{{- define "go-echo5c4387e9-fc03-4be5-91f9-2b9735d6a43b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo5c4387e9-fc03-4be5-91f9-2b9735d6a43b.fullname" -}}
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


{{- define "go-echo5c4387e9-fc03-4be5-91f9-2b9735d6a43b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo5c4387e9-fc03-4be5-91f9-2b9735d6a43b.labels" -}}
helm.sh/chart: {{ include "go-echo5c4387e9-fc03-4be5-91f9-2b9735d6a43b.chart" . }}
{{ include "go-echo5c4387e9-fc03-4be5-91f9-2b9735d6a43b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo5c4387e9-fc03-4be5-91f9-2b9735d6a43b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo5c4387e9-fc03-4be5-91f9-2b9735d6a43b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}