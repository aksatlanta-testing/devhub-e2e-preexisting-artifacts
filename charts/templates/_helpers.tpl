
{{- define "go-echo5a4ac1d1-7441-462a-b47b-2acd9718dc8a.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo5a4ac1d1-7441-462a-b47b-2acd9718dc8a.fullname" -}}
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


{{- define "go-echo5a4ac1d1-7441-462a-b47b-2acd9718dc8a.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo5a4ac1d1-7441-462a-b47b-2acd9718dc8a.labels" -}}
helm.sh/chart: {{ include "go-echo5a4ac1d1-7441-462a-b47b-2acd9718dc8a.chart" . }}
{{ include "go-echo5a4ac1d1-7441-462a-b47b-2acd9718dc8a.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo5a4ac1d1-7441-462a-b47b-2acd9718dc8a.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo5a4ac1d1-7441-462a-b47b-2acd9718dc8a.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}