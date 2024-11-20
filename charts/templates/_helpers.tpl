
{{- define "go-echo374fc87e-ad1f-4796-833a-fee509e5025d.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo374fc87e-ad1f-4796-833a-fee509e5025d.fullname" -}}
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


{{- define "go-echo374fc87e-ad1f-4796-833a-fee509e5025d.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo374fc87e-ad1f-4796-833a-fee509e5025d.labels" -}}
helm.sh/chart: {{ include "go-echo374fc87e-ad1f-4796-833a-fee509e5025d.chart" . }}
{{ include "go-echo374fc87e-ad1f-4796-833a-fee509e5025d.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo374fc87e-ad1f-4796-833a-fee509e5025d.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo374fc87e-ad1f-4796-833a-fee509e5025d.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}