
{{- define "go-echod61e6464-b922-427f-b93f-17e5782442ed.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod61e6464-b922-427f-b93f-17e5782442ed.fullname" -}}
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


{{- define "go-echod61e6464-b922-427f-b93f-17e5782442ed.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod61e6464-b922-427f-b93f-17e5782442ed.labels" -}}
helm.sh/chart: {{ include "go-echod61e6464-b922-427f-b93f-17e5782442ed.chart" . }}
{{ include "go-echod61e6464-b922-427f-b93f-17e5782442ed.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod61e6464-b922-427f-b93f-17e5782442ed.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod61e6464-b922-427f-b93f-17e5782442ed.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}