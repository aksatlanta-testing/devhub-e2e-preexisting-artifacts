
{{- define "go-echoec686d24-4847-4d7e-bf3e-c15837a31e80.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoec686d24-4847-4d7e-bf3e-c15837a31e80.fullname" -}}
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


{{- define "go-echoec686d24-4847-4d7e-bf3e-c15837a31e80.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoec686d24-4847-4d7e-bf3e-c15837a31e80.labels" -}}
helm.sh/chart: {{ include "go-echoec686d24-4847-4d7e-bf3e-c15837a31e80.chart" . }}
{{ include "go-echoec686d24-4847-4d7e-bf3e-c15837a31e80.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoec686d24-4847-4d7e-bf3e-c15837a31e80.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoec686d24-4847-4d7e-bf3e-c15837a31e80.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}