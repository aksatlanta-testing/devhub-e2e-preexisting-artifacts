
{{- define "go-echo914ba046-6143-41c9-b23e-d6a97efb5956.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo914ba046-6143-41c9-b23e-d6a97efb5956.fullname" -}}
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


{{- define "go-echo914ba046-6143-41c9-b23e-d6a97efb5956.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo914ba046-6143-41c9-b23e-d6a97efb5956.labels" -}}
helm.sh/chart: {{ include "go-echo914ba046-6143-41c9-b23e-d6a97efb5956.chart" . }}
{{ include "go-echo914ba046-6143-41c9-b23e-d6a97efb5956.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo914ba046-6143-41c9-b23e-d6a97efb5956.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo914ba046-6143-41c9-b23e-d6a97efb5956.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}