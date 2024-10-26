
{{- define "go-echoafc2aa25-78c0-454a-a347-a30cddef3b97.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoafc2aa25-78c0-454a-a347-a30cddef3b97.fullname" -}}
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


{{- define "go-echoafc2aa25-78c0-454a-a347-a30cddef3b97.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoafc2aa25-78c0-454a-a347-a30cddef3b97.labels" -}}
helm.sh/chart: {{ include "go-echoafc2aa25-78c0-454a-a347-a30cddef3b97.chart" . }}
{{ include "go-echoafc2aa25-78c0-454a-a347-a30cddef3b97.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoafc2aa25-78c0-454a-a347-a30cddef3b97.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoafc2aa25-78c0-454a-a347-a30cddef3b97.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}