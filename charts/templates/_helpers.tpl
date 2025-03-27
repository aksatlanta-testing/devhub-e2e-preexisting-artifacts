
{{- define "go-echo9c287759-cece-4a3e-adce-f97a341f625f.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo9c287759-cece-4a3e-adce-f97a341f625f.fullname" -}}
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


{{- define "go-echo9c287759-cece-4a3e-adce-f97a341f625f.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo9c287759-cece-4a3e-adce-f97a341f625f.labels" -}}
helm.sh/chart: {{ include "go-echo9c287759-cece-4a3e-adce-f97a341f625f.chart" . }}
{{ include "go-echo9c287759-cece-4a3e-adce-f97a341f625f.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo9c287759-cece-4a3e-adce-f97a341f625f.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo9c287759-cece-4a3e-adce-f97a341f625f.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}