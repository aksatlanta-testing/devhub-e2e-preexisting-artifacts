
{{- define "go-echo6dc33b88-5fa0-4c74-bd90-29e95a131a2f.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo6dc33b88-5fa0-4c74-bd90-29e95a131a2f.fullname" -}}
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


{{- define "go-echo6dc33b88-5fa0-4c74-bd90-29e95a131a2f.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo6dc33b88-5fa0-4c74-bd90-29e95a131a2f.labels" -}}
helm.sh/chart: {{ include "go-echo6dc33b88-5fa0-4c74-bd90-29e95a131a2f.chart" . }}
{{ include "go-echo6dc33b88-5fa0-4c74-bd90-29e95a131a2f.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo6dc33b88-5fa0-4c74-bd90-29e95a131a2f.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo6dc33b88-5fa0-4c74-bd90-29e95a131a2f.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}