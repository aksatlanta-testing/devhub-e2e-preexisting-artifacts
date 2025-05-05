
{{- define "go-echo765fb9f1-6e07-4937-ae47-697d565ddddc.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo765fb9f1-6e07-4937-ae47-697d565ddddc.fullname" -}}
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


{{- define "go-echo765fb9f1-6e07-4937-ae47-697d565ddddc.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo765fb9f1-6e07-4937-ae47-697d565ddddc.labels" -}}
helm.sh/chart: {{ include "go-echo765fb9f1-6e07-4937-ae47-697d565ddddc.chart" . }}
{{ include "go-echo765fb9f1-6e07-4937-ae47-697d565ddddc.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo765fb9f1-6e07-4937-ae47-697d565ddddc.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo765fb9f1-6e07-4937-ae47-697d565ddddc.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}