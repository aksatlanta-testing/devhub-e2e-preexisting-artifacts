
{{- define "go-echo4d90dc06-82c8-438f-8727-aca08e172dc8.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo4d90dc06-82c8-438f-8727-aca08e172dc8.fullname" -}}
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


{{- define "go-echo4d90dc06-82c8-438f-8727-aca08e172dc8.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo4d90dc06-82c8-438f-8727-aca08e172dc8.labels" -}}
helm.sh/chart: {{ include "go-echo4d90dc06-82c8-438f-8727-aca08e172dc8.chart" . }}
{{ include "go-echo4d90dc06-82c8-438f-8727-aca08e172dc8.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo4d90dc06-82c8-438f-8727-aca08e172dc8.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo4d90dc06-82c8-438f-8727-aca08e172dc8.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}