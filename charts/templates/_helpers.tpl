
{{- define "go-echo3b6c9192-9a0b-454f-b5f8-95a65e37e745.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo3b6c9192-9a0b-454f-b5f8-95a65e37e745.fullname" -}}
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


{{- define "go-echo3b6c9192-9a0b-454f-b5f8-95a65e37e745.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo3b6c9192-9a0b-454f-b5f8-95a65e37e745.labels" -}}
helm.sh/chart: {{ include "go-echo3b6c9192-9a0b-454f-b5f8-95a65e37e745.chart" . }}
{{ include "go-echo3b6c9192-9a0b-454f-b5f8-95a65e37e745.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo3b6c9192-9a0b-454f-b5f8-95a65e37e745.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo3b6c9192-9a0b-454f-b5f8-95a65e37e745.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}