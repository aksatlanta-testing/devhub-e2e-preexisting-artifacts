
{{- define "go-echo872e9d59-2d8d-49be-92cb-61298a726207.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo872e9d59-2d8d-49be-92cb-61298a726207.fullname" -}}
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


{{- define "go-echo872e9d59-2d8d-49be-92cb-61298a726207.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo872e9d59-2d8d-49be-92cb-61298a726207.labels" -}}
helm.sh/chart: {{ include "go-echo872e9d59-2d8d-49be-92cb-61298a726207.chart" . }}
{{ include "go-echo872e9d59-2d8d-49be-92cb-61298a726207.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo872e9d59-2d8d-49be-92cb-61298a726207.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo872e9d59-2d8d-49be-92cb-61298a726207.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}