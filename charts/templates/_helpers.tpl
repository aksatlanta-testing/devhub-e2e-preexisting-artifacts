
{{- define "go-echo8a8f93be-eaf0-452e-b49f-94bf6533703a.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo8a8f93be-eaf0-452e-b49f-94bf6533703a.fullname" -}}
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


{{- define "go-echo8a8f93be-eaf0-452e-b49f-94bf6533703a.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo8a8f93be-eaf0-452e-b49f-94bf6533703a.labels" -}}
helm.sh/chart: {{ include "go-echo8a8f93be-eaf0-452e-b49f-94bf6533703a.chart" . }}
{{ include "go-echo8a8f93be-eaf0-452e-b49f-94bf6533703a.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo8a8f93be-eaf0-452e-b49f-94bf6533703a.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo8a8f93be-eaf0-452e-b49f-94bf6533703a.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}