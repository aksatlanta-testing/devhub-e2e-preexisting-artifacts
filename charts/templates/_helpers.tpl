
{{- define "go-echobb2351a6-08bb-4b56-b425-6bfa397d9415.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobb2351a6-08bb-4b56-b425-6bfa397d9415.fullname" -}}
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


{{- define "go-echobb2351a6-08bb-4b56-b425-6bfa397d9415.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobb2351a6-08bb-4b56-b425-6bfa397d9415.labels" -}}
helm.sh/chart: {{ include "go-echobb2351a6-08bb-4b56-b425-6bfa397d9415.chart" . }}
{{ include "go-echobb2351a6-08bb-4b56-b425-6bfa397d9415.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echobb2351a6-08bb-4b56-b425-6bfa397d9415.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echobb2351a6-08bb-4b56-b425-6bfa397d9415.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}