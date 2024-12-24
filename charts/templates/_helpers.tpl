
{{- define "go-echo0caafe1a-5e78-4948-8361-9a53dc0bc59e.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo0caafe1a-5e78-4948-8361-9a53dc0bc59e.fullname" -}}
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


{{- define "go-echo0caafe1a-5e78-4948-8361-9a53dc0bc59e.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo0caafe1a-5e78-4948-8361-9a53dc0bc59e.labels" -}}
helm.sh/chart: {{ include "go-echo0caafe1a-5e78-4948-8361-9a53dc0bc59e.chart" . }}
{{ include "go-echo0caafe1a-5e78-4948-8361-9a53dc0bc59e.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo0caafe1a-5e78-4948-8361-9a53dc0bc59e.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo0caafe1a-5e78-4948-8361-9a53dc0bc59e.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}