
{{- define "go-echoc7d386be-3cc8-4eea-90b1-b39ce1bcdbfb.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc7d386be-3cc8-4eea-90b1-b39ce1bcdbfb.fullname" -}}
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


{{- define "go-echoc7d386be-3cc8-4eea-90b1-b39ce1bcdbfb.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc7d386be-3cc8-4eea-90b1-b39ce1bcdbfb.labels" -}}
helm.sh/chart: {{ include "go-echoc7d386be-3cc8-4eea-90b1-b39ce1bcdbfb.chart" . }}
{{ include "go-echoc7d386be-3cc8-4eea-90b1-b39ce1bcdbfb.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoc7d386be-3cc8-4eea-90b1-b39ce1bcdbfb.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoc7d386be-3cc8-4eea-90b1-b39ce1bcdbfb.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}