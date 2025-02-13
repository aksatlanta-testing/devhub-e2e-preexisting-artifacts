
{{- define "go-echo6687e214-ac53-40e9-92fb-83337b6a5dab.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo6687e214-ac53-40e9-92fb-83337b6a5dab.fullname" -}}
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


{{- define "go-echo6687e214-ac53-40e9-92fb-83337b6a5dab.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo6687e214-ac53-40e9-92fb-83337b6a5dab.labels" -}}
helm.sh/chart: {{ include "go-echo6687e214-ac53-40e9-92fb-83337b6a5dab.chart" . }}
{{ include "go-echo6687e214-ac53-40e9-92fb-83337b6a5dab.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo6687e214-ac53-40e9-92fb-83337b6a5dab.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo6687e214-ac53-40e9-92fb-83337b6a5dab.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}