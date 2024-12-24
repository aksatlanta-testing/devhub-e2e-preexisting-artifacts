
{{- define "go-echo0ff45416-5eb1-44d9-a995-7c3e02a1ee86.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo0ff45416-5eb1-44d9-a995-7c3e02a1ee86.fullname" -}}
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


{{- define "go-echo0ff45416-5eb1-44d9-a995-7c3e02a1ee86.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo0ff45416-5eb1-44d9-a995-7c3e02a1ee86.labels" -}}
helm.sh/chart: {{ include "go-echo0ff45416-5eb1-44d9-a995-7c3e02a1ee86.chart" . }}
{{ include "go-echo0ff45416-5eb1-44d9-a995-7c3e02a1ee86.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo0ff45416-5eb1-44d9-a995-7c3e02a1ee86.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo0ff45416-5eb1-44d9-a995-7c3e02a1ee86.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}