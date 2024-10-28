
{{- define "go-echo06b774ec-7df7-4c8a-9ff3-4db04c088879.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo06b774ec-7df7-4c8a-9ff3-4db04c088879.fullname" -}}
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


{{- define "go-echo06b774ec-7df7-4c8a-9ff3-4db04c088879.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo06b774ec-7df7-4c8a-9ff3-4db04c088879.labels" -}}
helm.sh/chart: {{ include "go-echo06b774ec-7df7-4c8a-9ff3-4db04c088879.chart" . }}
{{ include "go-echo06b774ec-7df7-4c8a-9ff3-4db04c088879.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo06b774ec-7df7-4c8a-9ff3-4db04c088879.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo06b774ec-7df7-4c8a-9ff3-4db04c088879.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}