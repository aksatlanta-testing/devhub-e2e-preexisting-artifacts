
{{- define "go-echo080e63a0-2811-4f41-93a8-24f9b33ef634.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo080e63a0-2811-4f41-93a8-24f9b33ef634.fullname" -}}
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


{{- define "go-echo080e63a0-2811-4f41-93a8-24f9b33ef634.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo080e63a0-2811-4f41-93a8-24f9b33ef634.labels" -}}
helm.sh/chart: {{ include "go-echo080e63a0-2811-4f41-93a8-24f9b33ef634.chart" . }}
{{ include "go-echo080e63a0-2811-4f41-93a8-24f9b33ef634.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo080e63a0-2811-4f41-93a8-24f9b33ef634.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo080e63a0-2811-4f41-93a8-24f9b33ef634.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}