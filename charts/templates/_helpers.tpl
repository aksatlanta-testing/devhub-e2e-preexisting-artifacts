
{{- define "go-echo5461c68c-7929-4354-be20-797513ea9b9c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo5461c68c-7929-4354-be20-797513ea9b9c.fullname" -}}
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


{{- define "go-echo5461c68c-7929-4354-be20-797513ea9b9c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo5461c68c-7929-4354-be20-797513ea9b9c.labels" -}}
helm.sh/chart: {{ include "go-echo5461c68c-7929-4354-be20-797513ea9b9c.chart" . }}
{{ include "go-echo5461c68c-7929-4354-be20-797513ea9b9c.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo5461c68c-7929-4354-be20-797513ea9b9c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo5461c68c-7929-4354-be20-797513ea9b9c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}