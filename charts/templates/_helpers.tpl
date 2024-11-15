
{{- define "go-echo396b49a0-3c21-4dbb-85f3-9e25451153bf.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo396b49a0-3c21-4dbb-85f3-9e25451153bf.fullname" -}}
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


{{- define "go-echo396b49a0-3c21-4dbb-85f3-9e25451153bf.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo396b49a0-3c21-4dbb-85f3-9e25451153bf.labels" -}}
helm.sh/chart: {{ include "go-echo396b49a0-3c21-4dbb-85f3-9e25451153bf.chart" . }}
{{ include "go-echo396b49a0-3c21-4dbb-85f3-9e25451153bf.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo396b49a0-3c21-4dbb-85f3-9e25451153bf.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo396b49a0-3c21-4dbb-85f3-9e25451153bf.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}