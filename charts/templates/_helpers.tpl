
{{- define "go-echo48a2571f-349d-4a51-acd6-5bf713cb5532.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo48a2571f-349d-4a51-acd6-5bf713cb5532.fullname" -}}
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


{{- define "go-echo48a2571f-349d-4a51-acd6-5bf713cb5532.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo48a2571f-349d-4a51-acd6-5bf713cb5532.labels" -}}
helm.sh/chart: {{ include "go-echo48a2571f-349d-4a51-acd6-5bf713cb5532.chart" . }}
{{ include "go-echo48a2571f-349d-4a51-acd6-5bf713cb5532.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo48a2571f-349d-4a51-acd6-5bf713cb5532.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo48a2571f-349d-4a51-acd6-5bf713cb5532.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}