
{{- define "go-echo5752c914-99e6-4ae2-ad60-335513cc2ead.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo5752c914-99e6-4ae2-ad60-335513cc2ead.fullname" -}}
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


{{- define "go-echo5752c914-99e6-4ae2-ad60-335513cc2ead.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo5752c914-99e6-4ae2-ad60-335513cc2ead.labels" -}}
helm.sh/chart: {{ include "go-echo5752c914-99e6-4ae2-ad60-335513cc2ead.chart" . }}
{{ include "go-echo5752c914-99e6-4ae2-ad60-335513cc2ead.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo5752c914-99e6-4ae2-ad60-335513cc2ead.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo5752c914-99e6-4ae2-ad60-335513cc2ead.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}