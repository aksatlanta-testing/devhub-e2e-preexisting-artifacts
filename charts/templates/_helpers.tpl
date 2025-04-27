
{{- define "go-echo391a5559-2e34-444c-bf84-9bcda27d867a.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo391a5559-2e34-444c-bf84-9bcda27d867a.fullname" -}}
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


{{- define "go-echo391a5559-2e34-444c-bf84-9bcda27d867a.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo391a5559-2e34-444c-bf84-9bcda27d867a.labels" -}}
helm.sh/chart: {{ include "go-echo391a5559-2e34-444c-bf84-9bcda27d867a.chart" . }}
{{ include "go-echo391a5559-2e34-444c-bf84-9bcda27d867a.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo391a5559-2e34-444c-bf84-9bcda27d867a.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo391a5559-2e34-444c-bf84-9bcda27d867a.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}