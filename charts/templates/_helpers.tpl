
{{- define "go-echofedc26e5-efdd-4ea9-a4fb-dfcd1a4480fc.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofedc26e5-efdd-4ea9-a4fb-dfcd1a4480fc.fullname" -}}
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


{{- define "go-echofedc26e5-efdd-4ea9-a4fb-dfcd1a4480fc.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofedc26e5-efdd-4ea9-a4fb-dfcd1a4480fc.labels" -}}
helm.sh/chart: {{ include "go-echofedc26e5-efdd-4ea9-a4fb-dfcd1a4480fc.chart" . }}
{{ include "go-echofedc26e5-efdd-4ea9-a4fb-dfcd1a4480fc.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echofedc26e5-efdd-4ea9-a4fb-dfcd1a4480fc.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echofedc26e5-efdd-4ea9-a4fb-dfcd1a4480fc.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}