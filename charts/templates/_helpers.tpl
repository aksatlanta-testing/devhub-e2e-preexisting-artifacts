
{{- define "go-echo6fa0605b-6301-4c50-a45a-d4d1d11a29be.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo6fa0605b-6301-4c50-a45a-d4d1d11a29be.fullname" -}}
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


{{- define "go-echo6fa0605b-6301-4c50-a45a-d4d1d11a29be.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo6fa0605b-6301-4c50-a45a-d4d1d11a29be.labels" -}}
helm.sh/chart: {{ include "go-echo6fa0605b-6301-4c50-a45a-d4d1d11a29be.chart" . }}
{{ include "go-echo6fa0605b-6301-4c50-a45a-d4d1d11a29be.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo6fa0605b-6301-4c50-a45a-d4d1d11a29be.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo6fa0605b-6301-4c50-a45a-d4d1d11a29be.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}