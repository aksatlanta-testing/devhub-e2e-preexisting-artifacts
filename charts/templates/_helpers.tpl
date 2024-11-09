
{{- define "go-echof7a0282e-1c98-4a91-8fa6-989db18f43fb.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof7a0282e-1c98-4a91-8fa6-989db18f43fb.fullname" -}}
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


{{- define "go-echof7a0282e-1c98-4a91-8fa6-989db18f43fb.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof7a0282e-1c98-4a91-8fa6-989db18f43fb.labels" -}}
helm.sh/chart: {{ include "go-echof7a0282e-1c98-4a91-8fa6-989db18f43fb.chart" . }}
{{ include "go-echof7a0282e-1c98-4a91-8fa6-989db18f43fb.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof7a0282e-1c98-4a91-8fa6-989db18f43fb.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof7a0282e-1c98-4a91-8fa6-989db18f43fb.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}