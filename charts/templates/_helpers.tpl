
{{- define "go-echo72f7f4b2-5bdc-4843-8e04-5b6c2b59483b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo72f7f4b2-5bdc-4843-8e04-5b6c2b59483b.fullname" -}}
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


{{- define "go-echo72f7f4b2-5bdc-4843-8e04-5b6c2b59483b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo72f7f4b2-5bdc-4843-8e04-5b6c2b59483b.labels" -}}
helm.sh/chart: {{ include "go-echo72f7f4b2-5bdc-4843-8e04-5b6c2b59483b.chart" . }}
{{ include "go-echo72f7f4b2-5bdc-4843-8e04-5b6c2b59483b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo72f7f4b2-5bdc-4843-8e04-5b6c2b59483b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo72f7f4b2-5bdc-4843-8e04-5b6c2b59483b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}