
{{- define "go-echoece73696-e25b-4e27-8994-c96363e97778.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoece73696-e25b-4e27-8994-c96363e97778.fullname" -}}
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


{{- define "go-echoece73696-e25b-4e27-8994-c96363e97778.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoece73696-e25b-4e27-8994-c96363e97778.labels" -}}
helm.sh/chart: {{ include "go-echoece73696-e25b-4e27-8994-c96363e97778.chart" . }}
{{ include "go-echoece73696-e25b-4e27-8994-c96363e97778.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoece73696-e25b-4e27-8994-c96363e97778.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoece73696-e25b-4e27-8994-c96363e97778.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}