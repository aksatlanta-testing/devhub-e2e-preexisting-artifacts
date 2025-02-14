
{{- define "go-echo5abe4c67-9278-4f6c-816c-6e3305b2352b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo5abe4c67-9278-4f6c-816c-6e3305b2352b.fullname" -}}
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


{{- define "go-echo5abe4c67-9278-4f6c-816c-6e3305b2352b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo5abe4c67-9278-4f6c-816c-6e3305b2352b.labels" -}}
helm.sh/chart: {{ include "go-echo5abe4c67-9278-4f6c-816c-6e3305b2352b.chart" . }}
{{ include "go-echo5abe4c67-9278-4f6c-816c-6e3305b2352b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo5abe4c67-9278-4f6c-816c-6e3305b2352b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo5abe4c67-9278-4f6c-816c-6e3305b2352b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}