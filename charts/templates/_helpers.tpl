
{{- define "go-echo45ca3424-39f1-420f-966c-63dd11067047.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo45ca3424-39f1-420f-966c-63dd11067047.fullname" -}}
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


{{- define "go-echo45ca3424-39f1-420f-966c-63dd11067047.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo45ca3424-39f1-420f-966c-63dd11067047.labels" -}}
helm.sh/chart: {{ include "go-echo45ca3424-39f1-420f-966c-63dd11067047.chart" . }}
{{ include "go-echo45ca3424-39f1-420f-966c-63dd11067047.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo45ca3424-39f1-420f-966c-63dd11067047.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo45ca3424-39f1-420f-966c-63dd11067047.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}