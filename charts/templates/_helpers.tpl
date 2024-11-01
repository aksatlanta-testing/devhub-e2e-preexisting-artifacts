
{{- define "go-echo153e2c66-0b03-4aa5-ac30-955f6f112541.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo153e2c66-0b03-4aa5-ac30-955f6f112541.fullname" -}}
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


{{- define "go-echo153e2c66-0b03-4aa5-ac30-955f6f112541.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo153e2c66-0b03-4aa5-ac30-955f6f112541.labels" -}}
helm.sh/chart: {{ include "go-echo153e2c66-0b03-4aa5-ac30-955f6f112541.chart" . }}
{{ include "go-echo153e2c66-0b03-4aa5-ac30-955f6f112541.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo153e2c66-0b03-4aa5-ac30-955f6f112541.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo153e2c66-0b03-4aa5-ac30-955f6f112541.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}