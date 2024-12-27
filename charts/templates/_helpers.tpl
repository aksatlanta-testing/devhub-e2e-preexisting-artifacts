
{{- define "go-echo76b4aa0a-f87b-4520-853d-006ab6ee6f3a.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo76b4aa0a-f87b-4520-853d-006ab6ee6f3a.fullname" -}}
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


{{- define "go-echo76b4aa0a-f87b-4520-853d-006ab6ee6f3a.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo76b4aa0a-f87b-4520-853d-006ab6ee6f3a.labels" -}}
helm.sh/chart: {{ include "go-echo76b4aa0a-f87b-4520-853d-006ab6ee6f3a.chart" . }}
{{ include "go-echo76b4aa0a-f87b-4520-853d-006ab6ee6f3a.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo76b4aa0a-f87b-4520-853d-006ab6ee6f3a.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo76b4aa0a-f87b-4520-853d-006ab6ee6f3a.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}