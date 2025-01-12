
{{- define "go-echo718b57e7-f59b-4bd6-8339-ad9aa8eb3165.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo718b57e7-f59b-4bd6-8339-ad9aa8eb3165.fullname" -}}
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


{{- define "go-echo718b57e7-f59b-4bd6-8339-ad9aa8eb3165.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo718b57e7-f59b-4bd6-8339-ad9aa8eb3165.labels" -}}
helm.sh/chart: {{ include "go-echo718b57e7-f59b-4bd6-8339-ad9aa8eb3165.chart" . }}
{{ include "go-echo718b57e7-f59b-4bd6-8339-ad9aa8eb3165.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo718b57e7-f59b-4bd6-8339-ad9aa8eb3165.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo718b57e7-f59b-4bd6-8339-ad9aa8eb3165.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}