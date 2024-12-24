
{{- define "go-echoe4c294ca-896d-4414-b00f-cacf53f33ca9.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe4c294ca-896d-4414-b00f-cacf53f33ca9.fullname" -}}
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


{{- define "go-echoe4c294ca-896d-4414-b00f-cacf53f33ca9.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe4c294ca-896d-4414-b00f-cacf53f33ca9.labels" -}}
helm.sh/chart: {{ include "go-echoe4c294ca-896d-4414-b00f-cacf53f33ca9.chart" . }}
{{ include "go-echoe4c294ca-896d-4414-b00f-cacf53f33ca9.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoe4c294ca-896d-4414-b00f-cacf53f33ca9.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoe4c294ca-896d-4414-b00f-cacf53f33ca9.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}