
{{- define "go-echocefc205e-e299-4137-919e-3cd9196a8db7.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocefc205e-e299-4137-919e-3cd9196a8db7.fullname" -}}
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


{{- define "go-echocefc205e-e299-4137-919e-3cd9196a8db7.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocefc205e-e299-4137-919e-3cd9196a8db7.labels" -}}
helm.sh/chart: {{ include "go-echocefc205e-e299-4137-919e-3cd9196a8db7.chart" . }}
{{ include "go-echocefc205e-e299-4137-919e-3cd9196a8db7.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echocefc205e-e299-4137-919e-3cd9196a8db7.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echocefc205e-e299-4137-919e-3cd9196a8db7.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}