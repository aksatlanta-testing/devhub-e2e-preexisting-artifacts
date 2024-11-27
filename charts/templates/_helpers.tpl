
{{- define "go-echo42f35ee2-3d84-445c-b0d2-1cbf30c97cee.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo42f35ee2-3d84-445c-b0d2-1cbf30c97cee.fullname" -}}
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


{{- define "go-echo42f35ee2-3d84-445c-b0d2-1cbf30c97cee.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo42f35ee2-3d84-445c-b0d2-1cbf30c97cee.labels" -}}
helm.sh/chart: {{ include "go-echo42f35ee2-3d84-445c-b0d2-1cbf30c97cee.chart" . }}
{{ include "go-echo42f35ee2-3d84-445c-b0d2-1cbf30c97cee.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo42f35ee2-3d84-445c-b0d2-1cbf30c97cee.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo42f35ee2-3d84-445c-b0d2-1cbf30c97cee.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}