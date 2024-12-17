
{{- define "go-echofe280a9f-7d0d-4c09-8020-33f0893d5e41.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofe280a9f-7d0d-4c09-8020-33f0893d5e41.fullname" -}}
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


{{- define "go-echofe280a9f-7d0d-4c09-8020-33f0893d5e41.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofe280a9f-7d0d-4c09-8020-33f0893d5e41.labels" -}}
helm.sh/chart: {{ include "go-echofe280a9f-7d0d-4c09-8020-33f0893d5e41.chart" . }}
{{ include "go-echofe280a9f-7d0d-4c09-8020-33f0893d5e41.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echofe280a9f-7d0d-4c09-8020-33f0893d5e41.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echofe280a9f-7d0d-4c09-8020-33f0893d5e41.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}