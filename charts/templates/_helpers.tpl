
{{- define "go-echo9b9b0d06-7ba0-4bfc-9eb2-503170ec43df.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo9b9b0d06-7ba0-4bfc-9eb2-503170ec43df.fullname" -}}
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


{{- define "go-echo9b9b0d06-7ba0-4bfc-9eb2-503170ec43df.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo9b9b0d06-7ba0-4bfc-9eb2-503170ec43df.labels" -}}
helm.sh/chart: {{ include "go-echo9b9b0d06-7ba0-4bfc-9eb2-503170ec43df.chart" . }}
{{ include "go-echo9b9b0d06-7ba0-4bfc-9eb2-503170ec43df.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo9b9b0d06-7ba0-4bfc-9eb2-503170ec43df.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo9b9b0d06-7ba0-4bfc-9eb2-503170ec43df.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}