
{{- define "go-echo3e247fcd-6374-49b6-864e-bc596336176e.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo3e247fcd-6374-49b6-864e-bc596336176e.fullname" -}}
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


{{- define "go-echo3e247fcd-6374-49b6-864e-bc596336176e.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo3e247fcd-6374-49b6-864e-bc596336176e.labels" -}}
helm.sh/chart: {{ include "go-echo3e247fcd-6374-49b6-864e-bc596336176e.chart" . }}
{{ include "go-echo3e247fcd-6374-49b6-864e-bc596336176e.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo3e247fcd-6374-49b6-864e-bc596336176e.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo3e247fcd-6374-49b6-864e-bc596336176e.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}