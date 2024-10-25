
{{- define "go-echo185cc6d9-d376-42e7-b357-27820b618663.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo185cc6d9-d376-42e7-b357-27820b618663.fullname" -}}
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


{{- define "go-echo185cc6d9-d376-42e7-b357-27820b618663.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo185cc6d9-d376-42e7-b357-27820b618663.labels" -}}
helm.sh/chart: {{ include "go-echo185cc6d9-d376-42e7-b357-27820b618663.chart" . }}
{{ include "go-echo185cc6d9-d376-42e7-b357-27820b618663.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo185cc6d9-d376-42e7-b357-27820b618663.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo185cc6d9-d376-42e7-b357-27820b618663.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}