
{{- define "go-echobf6f882e-3141-40dc-bae9-2333a6c2d85e.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobf6f882e-3141-40dc-bae9-2333a6c2d85e.fullname" -}}
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


{{- define "go-echobf6f882e-3141-40dc-bae9-2333a6c2d85e.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobf6f882e-3141-40dc-bae9-2333a6c2d85e.labels" -}}
helm.sh/chart: {{ include "go-echobf6f882e-3141-40dc-bae9-2333a6c2d85e.chart" . }}
{{ include "go-echobf6f882e-3141-40dc-bae9-2333a6c2d85e.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echobf6f882e-3141-40dc-bae9-2333a6c2d85e.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echobf6f882e-3141-40dc-bae9-2333a6c2d85e.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}