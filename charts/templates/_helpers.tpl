
{{- define "go-echo84456165-f6e5-4a41-a9ae-a82ea53c9f7e.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo84456165-f6e5-4a41-a9ae-a82ea53c9f7e.fullname" -}}
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


{{- define "go-echo84456165-f6e5-4a41-a9ae-a82ea53c9f7e.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo84456165-f6e5-4a41-a9ae-a82ea53c9f7e.labels" -}}
helm.sh/chart: {{ include "go-echo84456165-f6e5-4a41-a9ae-a82ea53c9f7e.chart" . }}
{{ include "go-echo84456165-f6e5-4a41-a9ae-a82ea53c9f7e.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo84456165-f6e5-4a41-a9ae-a82ea53c9f7e.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo84456165-f6e5-4a41-a9ae-a82ea53c9f7e.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}