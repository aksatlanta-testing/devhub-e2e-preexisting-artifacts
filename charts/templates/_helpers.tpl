
{{- define "go-echo7d1f43b6-93b4-40d5-8307-c35f90d7fbe4.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo7d1f43b6-93b4-40d5-8307-c35f90d7fbe4.fullname" -}}
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


{{- define "go-echo7d1f43b6-93b4-40d5-8307-c35f90d7fbe4.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo7d1f43b6-93b4-40d5-8307-c35f90d7fbe4.labels" -}}
helm.sh/chart: {{ include "go-echo7d1f43b6-93b4-40d5-8307-c35f90d7fbe4.chart" . }}
{{ include "go-echo7d1f43b6-93b4-40d5-8307-c35f90d7fbe4.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo7d1f43b6-93b4-40d5-8307-c35f90d7fbe4.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo7d1f43b6-93b4-40d5-8307-c35f90d7fbe4.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}