
{{- define "go-echo80be323e-b98e-4d0e-ad66-24c9ee411144.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo80be323e-b98e-4d0e-ad66-24c9ee411144.fullname" -}}
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


{{- define "go-echo80be323e-b98e-4d0e-ad66-24c9ee411144.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo80be323e-b98e-4d0e-ad66-24c9ee411144.labels" -}}
helm.sh/chart: {{ include "go-echo80be323e-b98e-4d0e-ad66-24c9ee411144.chart" . }}
{{ include "go-echo80be323e-b98e-4d0e-ad66-24c9ee411144.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo80be323e-b98e-4d0e-ad66-24c9ee411144.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo80be323e-b98e-4d0e-ad66-24c9ee411144.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}