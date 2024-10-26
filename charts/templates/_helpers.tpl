
{{- define "go-echo5d9cd473-af85-43de-b369-fd08f5491f27.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo5d9cd473-af85-43de-b369-fd08f5491f27.fullname" -}}
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


{{- define "go-echo5d9cd473-af85-43de-b369-fd08f5491f27.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo5d9cd473-af85-43de-b369-fd08f5491f27.labels" -}}
helm.sh/chart: {{ include "go-echo5d9cd473-af85-43de-b369-fd08f5491f27.chart" . }}
{{ include "go-echo5d9cd473-af85-43de-b369-fd08f5491f27.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo5d9cd473-af85-43de-b369-fd08f5491f27.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo5d9cd473-af85-43de-b369-fd08f5491f27.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}