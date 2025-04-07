
{{- define "go-echo18daf192-13ea-4110-8388-0d4f7a939387.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo18daf192-13ea-4110-8388-0d4f7a939387.fullname" -}}
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


{{- define "go-echo18daf192-13ea-4110-8388-0d4f7a939387.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo18daf192-13ea-4110-8388-0d4f7a939387.labels" -}}
helm.sh/chart: {{ include "go-echo18daf192-13ea-4110-8388-0d4f7a939387.chart" . }}
{{ include "go-echo18daf192-13ea-4110-8388-0d4f7a939387.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo18daf192-13ea-4110-8388-0d4f7a939387.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo18daf192-13ea-4110-8388-0d4f7a939387.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}