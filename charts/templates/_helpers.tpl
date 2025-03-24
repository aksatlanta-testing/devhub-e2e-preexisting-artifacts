
{{- define "go-echo9a92cc58-1278-48ba-861b-288b6927f81c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo9a92cc58-1278-48ba-861b-288b6927f81c.fullname" -}}
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


{{- define "go-echo9a92cc58-1278-48ba-861b-288b6927f81c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo9a92cc58-1278-48ba-861b-288b6927f81c.labels" -}}
helm.sh/chart: {{ include "go-echo9a92cc58-1278-48ba-861b-288b6927f81c.chart" . }}
{{ include "go-echo9a92cc58-1278-48ba-861b-288b6927f81c.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo9a92cc58-1278-48ba-861b-288b6927f81c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo9a92cc58-1278-48ba-861b-288b6927f81c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}