
{{- define "go-echocae8e5a1-f504-4f17-b1ad-f048bb7f122e.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocae8e5a1-f504-4f17-b1ad-f048bb7f122e.fullname" -}}
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


{{- define "go-echocae8e5a1-f504-4f17-b1ad-f048bb7f122e.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocae8e5a1-f504-4f17-b1ad-f048bb7f122e.labels" -}}
helm.sh/chart: {{ include "go-echocae8e5a1-f504-4f17-b1ad-f048bb7f122e.chart" . }}
{{ include "go-echocae8e5a1-f504-4f17-b1ad-f048bb7f122e.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echocae8e5a1-f504-4f17-b1ad-f048bb7f122e.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echocae8e5a1-f504-4f17-b1ad-f048bb7f122e.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}