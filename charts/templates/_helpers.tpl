
{{- define "go-echodc92ad6a-e964-49e8-ad38-45d1e3e3a815.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodc92ad6a-e964-49e8-ad38-45d1e3e3a815.fullname" -}}
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


{{- define "go-echodc92ad6a-e964-49e8-ad38-45d1e3e3a815.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodc92ad6a-e964-49e8-ad38-45d1e3e3a815.labels" -}}
helm.sh/chart: {{ include "go-echodc92ad6a-e964-49e8-ad38-45d1e3e3a815.chart" . }}
{{ include "go-echodc92ad6a-e964-49e8-ad38-45d1e3e3a815.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echodc92ad6a-e964-49e8-ad38-45d1e3e3a815.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echodc92ad6a-e964-49e8-ad38-45d1e3e3a815.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}