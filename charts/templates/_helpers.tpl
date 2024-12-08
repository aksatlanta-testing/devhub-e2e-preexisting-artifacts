
{{- define "go-echo6ba3cb32-b3e8-4dc6-832f-2b8ddf1e6eb4.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo6ba3cb32-b3e8-4dc6-832f-2b8ddf1e6eb4.fullname" -}}
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


{{- define "go-echo6ba3cb32-b3e8-4dc6-832f-2b8ddf1e6eb4.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo6ba3cb32-b3e8-4dc6-832f-2b8ddf1e6eb4.labels" -}}
helm.sh/chart: {{ include "go-echo6ba3cb32-b3e8-4dc6-832f-2b8ddf1e6eb4.chart" . }}
{{ include "go-echo6ba3cb32-b3e8-4dc6-832f-2b8ddf1e6eb4.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo6ba3cb32-b3e8-4dc6-832f-2b8ddf1e6eb4.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo6ba3cb32-b3e8-4dc6-832f-2b8ddf1e6eb4.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}