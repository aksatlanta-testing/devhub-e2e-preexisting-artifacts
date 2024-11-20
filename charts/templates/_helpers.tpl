
{{- define "go-echo02b157c1-50b4-4937-aa8d-797929a38f2e.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo02b157c1-50b4-4937-aa8d-797929a38f2e.fullname" -}}
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


{{- define "go-echo02b157c1-50b4-4937-aa8d-797929a38f2e.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo02b157c1-50b4-4937-aa8d-797929a38f2e.labels" -}}
helm.sh/chart: {{ include "go-echo02b157c1-50b4-4937-aa8d-797929a38f2e.chart" . }}
{{ include "go-echo02b157c1-50b4-4937-aa8d-797929a38f2e.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo02b157c1-50b4-4937-aa8d-797929a38f2e.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo02b157c1-50b4-4937-aa8d-797929a38f2e.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}