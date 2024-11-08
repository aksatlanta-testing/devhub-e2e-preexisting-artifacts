
{{- define "go-echo317d6b4a-c79f-4cbc-be4e-3c383e7e7919.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo317d6b4a-c79f-4cbc-be4e-3c383e7e7919.fullname" -}}
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


{{- define "go-echo317d6b4a-c79f-4cbc-be4e-3c383e7e7919.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo317d6b4a-c79f-4cbc-be4e-3c383e7e7919.labels" -}}
helm.sh/chart: {{ include "go-echo317d6b4a-c79f-4cbc-be4e-3c383e7e7919.chart" . }}
{{ include "go-echo317d6b4a-c79f-4cbc-be4e-3c383e7e7919.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo317d6b4a-c79f-4cbc-be4e-3c383e7e7919.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo317d6b4a-c79f-4cbc-be4e-3c383e7e7919.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}