
{{- define "go-echo22dba7a0-f623-4127-b82d-3cb9bdd899df.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo22dba7a0-f623-4127-b82d-3cb9bdd899df.fullname" -}}
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


{{- define "go-echo22dba7a0-f623-4127-b82d-3cb9bdd899df.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo22dba7a0-f623-4127-b82d-3cb9bdd899df.labels" -}}
helm.sh/chart: {{ include "go-echo22dba7a0-f623-4127-b82d-3cb9bdd899df.chart" . }}
{{ include "go-echo22dba7a0-f623-4127-b82d-3cb9bdd899df.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo22dba7a0-f623-4127-b82d-3cb9bdd899df.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo22dba7a0-f623-4127-b82d-3cb9bdd899df.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}