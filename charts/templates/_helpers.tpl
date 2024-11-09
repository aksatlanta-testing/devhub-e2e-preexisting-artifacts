
{{- define "go-echo7535f5e3-3b75-4513-9231-d81688eda0a0.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo7535f5e3-3b75-4513-9231-d81688eda0a0.fullname" -}}
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


{{- define "go-echo7535f5e3-3b75-4513-9231-d81688eda0a0.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo7535f5e3-3b75-4513-9231-d81688eda0a0.labels" -}}
helm.sh/chart: {{ include "go-echo7535f5e3-3b75-4513-9231-d81688eda0a0.chart" . }}
{{ include "go-echo7535f5e3-3b75-4513-9231-d81688eda0a0.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo7535f5e3-3b75-4513-9231-d81688eda0a0.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo7535f5e3-3b75-4513-9231-d81688eda0a0.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}