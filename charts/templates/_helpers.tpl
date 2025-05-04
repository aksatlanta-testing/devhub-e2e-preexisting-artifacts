
{{- define "go-echo17f11297-e132-4990-9001-f2fa729e9ceb.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo17f11297-e132-4990-9001-f2fa729e9ceb.fullname" -}}
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


{{- define "go-echo17f11297-e132-4990-9001-f2fa729e9ceb.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo17f11297-e132-4990-9001-f2fa729e9ceb.labels" -}}
helm.sh/chart: {{ include "go-echo17f11297-e132-4990-9001-f2fa729e9ceb.chart" . }}
{{ include "go-echo17f11297-e132-4990-9001-f2fa729e9ceb.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo17f11297-e132-4990-9001-f2fa729e9ceb.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo17f11297-e132-4990-9001-f2fa729e9ceb.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}