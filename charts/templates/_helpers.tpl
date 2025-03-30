
{{- define "go-echo24db0771-748c-4051-bdc7-8560e6222ebd.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo24db0771-748c-4051-bdc7-8560e6222ebd.fullname" -}}
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


{{- define "go-echo24db0771-748c-4051-bdc7-8560e6222ebd.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo24db0771-748c-4051-bdc7-8560e6222ebd.labels" -}}
helm.sh/chart: {{ include "go-echo24db0771-748c-4051-bdc7-8560e6222ebd.chart" . }}
{{ include "go-echo24db0771-748c-4051-bdc7-8560e6222ebd.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo24db0771-748c-4051-bdc7-8560e6222ebd.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo24db0771-748c-4051-bdc7-8560e6222ebd.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}