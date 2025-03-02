
{{- define "go-echoaa1b09c2-7ff2-4d83-a13f-90618c5a6167.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoaa1b09c2-7ff2-4d83-a13f-90618c5a6167.fullname" -}}
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


{{- define "go-echoaa1b09c2-7ff2-4d83-a13f-90618c5a6167.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoaa1b09c2-7ff2-4d83-a13f-90618c5a6167.labels" -}}
helm.sh/chart: {{ include "go-echoaa1b09c2-7ff2-4d83-a13f-90618c5a6167.chart" . }}
{{ include "go-echoaa1b09c2-7ff2-4d83-a13f-90618c5a6167.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoaa1b09c2-7ff2-4d83-a13f-90618c5a6167.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoaa1b09c2-7ff2-4d83-a13f-90618c5a6167.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}