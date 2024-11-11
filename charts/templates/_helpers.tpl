
{{- define "go-echoc86b95ef-791c-4091-b313-1d549843c835.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc86b95ef-791c-4091-b313-1d549843c835.fullname" -}}
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


{{- define "go-echoc86b95ef-791c-4091-b313-1d549843c835.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc86b95ef-791c-4091-b313-1d549843c835.labels" -}}
helm.sh/chart: {{ include "go-echoc86b95ef-791c-4091-b313-1d549843c835.chart" . }}
{{ include "go-echoc86b95ef-791c-4091-b313-1d549843c835.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoc86b95ef-791c-4091-b313-1d549843c835.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoc86b95ef-791c-4091-b313-1d549843c835.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}