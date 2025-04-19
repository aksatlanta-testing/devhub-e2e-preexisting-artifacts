
{{- define "go-echoc56437fe-765e-4a86-b38e-fb5202739909.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc56437fe-765e-4a86-b38e-fb5202739909.fullname" -}}
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


{{- define "go-echoc56437fe-765e-4a86-b38e-fb5202739909.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc56437fe-765e-4a86-b38e-fb5202739909.labels" -}}
helm.sh/chart: {{ include "go-echoc56437fe-765e-4a86-b38e-fb5202739909.chart" . }}
{{ include "go-echoc56437fe-765e-4a86-b38e-fb5202739909.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoc56437fe-765e-4a86-b38e-fb5202739909.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoc56437fe-765e-4a86-b38e-fb5202739909.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}