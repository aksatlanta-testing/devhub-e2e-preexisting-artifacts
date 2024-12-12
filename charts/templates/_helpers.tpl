
{{- define "go-echo11e1b734-5c84-427a-a0b0-e9a4d5e190c6.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo11e1b734-5c84-427a-a0b0-e9a4d5e190c6.fullname" -}}
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


{{- define "go-echo11e1b734-5c84-427a-a0b0-e9a4d5e190c6.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo11e1b734-5c84-427a-a0b0-e9a4d5e190c6.labels" -}}
helm.sh/chart: {{ include "go-echo11e1b734-5c84-427a-a0b0-e9a4d5e190c6.chart" . }}
{{ include "go-echo11e1b734-5c84-427a-a0b0-e9a4d5e190c6.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo11e1b734-5c84-427a-a0b0-e9a4d5e190c6.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo11e1b734-5c84-427a-a0b0-e9a4d5e190c6.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}