
{{- define "go-echoac4b4790-486a-4cf3-ba2c-086e1e6ff993.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoac4b4790-486a-4cf3-ba2c-086e1e6ff993.fullname" -}}
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


{{- define "go-echoac4b4790-486a-4cf3-ba2c-086e1e6ff993.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoac4b4790-486a-4cf3-ba2c-086e1e6ff993.labels" -}}
helm.sh/chart: {{ include "go-echoac4b4790-486a-4cf3-ba2c-086e1e6ff993.chart" . }}
{{ include "go-echoac4b4790-486a-4cf3-ba2c-086e1e6ff993.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoac4b4790-486a-4cf3-ba2c-086e1e6ff993.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoac4b4790-486a-4cf3-ba2c-086e1e6ff993.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}