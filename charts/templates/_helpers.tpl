
{{- define "go-echo29404d0f-38b7-4095-8f09-f682946dd6fc.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo29404d0f-38b7-4095-8f09-f682946dd6fc.fullname" -}}
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


{{- define "go-echo29404d0f-38b7-4095-8f09-f682946dd6fc.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo29404d0f-38b7-4095-8f09-f682946dd6fc.labels" -}}
helm.sh/chart: {{ include "go-echo29404d0f-38b7-4095-8f09-f682946dd6fc.chart" . }}
{{ include "go-echo29404d0f-38b7-4095-8f09-f682946dd6fc.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo29404d0f-38b7-4095-8f09-f682946dd6fc.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo29404d0f-38b7-4095-8f09-f682946dd6fc.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}