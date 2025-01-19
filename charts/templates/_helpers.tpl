
{{- define "go-echo780163d0-f43d-4e9e-b3c7-06cfbac5ddbe.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo780163d0-f43d-4e9e-b3c7-06cfbac5ddbe.fullname" -}}
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


{{- define "go-echo780163d0-f43d-4e9e-b3c7-06cfbac5ddbe.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo780163d0-f43d-4e9e-b3c7-06cfbac5ddbe.labels" -}}
helm.sh/chart: {{ include "go-echo780163d0-f43d-4e9e-b3c7-06cfbac5ddbe.chart" . }}
{{ include "go-echo780163d0-f43d-4e9e-b3c7-06cfbac5ddbe.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo780163d0-f43d-4e9e-b3c7-06cfbac5ddbe.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo780163d0-f43d-4e9e-b3c7-06cfbac5ddbe.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}