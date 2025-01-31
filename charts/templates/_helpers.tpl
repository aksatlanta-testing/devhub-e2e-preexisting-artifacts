
{{- define "go-echo3e27a5fa-9bdc-45cc-96b1-cb70807983dc.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo3e27a5fa-9bdc-45cc-96b1-cb70807983dc.fullname" -}}
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


{{- define "go-echo3e27a5fa-9bdc-45cc-96b1-cb70807983dc.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo3e27a5fa-9bdc-45cc-96b1-cb70807983dc.labels" -}}
helm.sh/chart: {{ include "go-echo3e27a5fa-9bdc-45cc-96b1-cb70807983dc.chart" . }}
{{ include "go-echo3e27a5fa-9bdc-45cc-96b1-cb70807983dc.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo3e27a5fa-9bdc-45cc-96b1-cb70807983dc.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo3e27a5fa-9bdc-45cc-96b1-cb70807983dc.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}