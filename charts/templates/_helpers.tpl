
{{- define "go-echo2b17188b-f9cc-459b-8c71-66b2e4b3b52d.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo2b17188b-f9cc-459b-8c71-66b2e4b3b52d.fullname" -}}
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


{{- define "go-echo2b17188b-f9cc-459b-8c71-66b2e4b3b52d.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo2b17188b-f9cc-459b-8c71-66b2e4b3b52d.labels" -}}
helm.sh/chart: {{ include "go-echo2b17188b-f9cc-459b-8c71-66b2e4b3b52d.chart" . }}
{{ include "go-echo2b17188b-f9cc-459b-8c71-66b2e4b3b52d.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo2b17188b-f9cc-459b-8c71-66b2e4b3b52d.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo2b17188b-f9cc-459b-8c71-66b2e4b3b52d.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}