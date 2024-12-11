
{{- define "go-echo39c7ab1e-a450-4cee-9de8-1238ff805378.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo39c7ab1e-a450-4cee-9de8-1238ff805378.fullname" -}}
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


{{- define "go-echo39c7ab1e-a450-4cee-9de8-1238ff805378.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo39c7ab1e-a450-4cee-9de8-1238ff805378.labels" -}}
helm.sh/chart: {{ include "go-echo39c7ab1e-a450-4cee-9de8-1238ff805378.chart" . }}
{{ include "go-echo39c7ab1e-a450-4cee-9de8-1238ff805378.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo39c7ab1e-a450-4cee-9de8-1238ff805378.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo39c7ab1e-a450-4cee-9de8-1238ff805378.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}