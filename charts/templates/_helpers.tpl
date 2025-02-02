
{{- define "go-echod847a9c8-5adc-44ed-a7d4-481613417eab.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod847a9c8-5adc-44ed-a7d4-481613417eab.fullname" -}}
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


{{- define "go-echod847a9c8-5adc-44ed-a7d4-481613417eab.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod847a9c8-5adc-44ed-a7d4-481613417eab.labels" -}}
helm.sh/chart: {{ include "go-echod847a9c8-5adc-44ed-a7d4-481613417eab.chart" . }}
{{ include "go-echod847a9c8-5adc-44ed-a7d4-481613417eab.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod847a9c8-5adc-44ed-a7d4-481613417eab.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod847a9c8-5adc-44ed-a7d4-481613417eab.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}