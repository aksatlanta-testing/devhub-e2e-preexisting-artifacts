
{{- define "go-echoada2f62e-0b8f-4880-9e83-ae2b3f92366d.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoada2f62e-0b8f-4880-9e83-ae2b3f92366d.fullname" -}}
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


{{- define "go-echoada2f62e-0b8f-4880-9e83-ae2b3f92366d.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoada2f62e-0b8f-4880-9e83-ae2b3f92366d.labels" -}}
helm.sh/chart: {{ include "go-echoada2f62e-0b8f-4880-9e83-ae2b3f92366d.chart" . }}
{{ include "go-echoada2f62e-0b8f-4880-9e83-ae2b3f92366d.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoada2f62e-0b8f-4880-9e83-ae2b3f92366d.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoada2f62e-0b8f-4880-9e83-ae2b3f92366d.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}