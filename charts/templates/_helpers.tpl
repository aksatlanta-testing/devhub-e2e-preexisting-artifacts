
{{- define "go-echoc3bb7cc0-9a50-468a-8734-5a6b89e8beef.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc3bb7cc0-9a50-468a-8734-5a6b89e8beef.fullname" -}}
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


{{- define "go-echoc3bb7cc0-9a50-468a-8734-5a6b89e8beef.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc3bb7cc0-9a50-468a-8734-5a6b89e8beef.labels" -}}
helm.sh/chart: {{ include "go-echoc3bb7cc0-9a50-468a-8734-5a6b89e8beef.chart" . }}
{{ include "go-echoc3bb7cc0-9a50-468a-8734-5a6b89e8beef.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoc3bb7cc0-9a50-468a-8734-5a6b89e8beef.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoc3bb7cc0-9a50-468a-8734-5a6b89e8beef.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}