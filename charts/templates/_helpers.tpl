
{{- define "go-echoae890e48-cdfe-4654-aa9a-8ec4aee761f6.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoae890e48-cdfe-4654-aa9a-8ec4aee761f6.fullname" -}}
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


{{- define "go-echoae890e48-cdfe-4654-aa9a-8ec4aee761f6.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoae890e48-cdfe-4654-aa9a-8ec4aee761f6.labels" -}}
helm.sh/chart: {{ include "go-echoae890e48-cdfe-4654-aa9a-8ec4aee761f6.chart" . }}
{{ include "go-echoae890e48-cdfe-4654-aa9a-8ec4aee761f6.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoae890e48-cdfe-4654-aa9a-8ec4aee761f6.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoae890e48-cdfe-4654-aa9a-8ec4aee761f6.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}