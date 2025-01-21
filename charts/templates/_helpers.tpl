
{{- define "go-echoadb3a853-c89c-4a34-b86c-cfcca5cc8b43.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoadb3a853-c89c-4a34-b86c-cfcca5cc8b43.fullname" -}}
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


{{- define "go-echoadb3a853-c89c-4a34-b86c-cfcca5cc8b43.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoadb3a853-c89c-4a34-b86c-cfcca5cc8b43.labels" -}}
helm.sh/chart: {{ include "go-echoadb3a853-c89c-4a34-b86c-cfcca5cc8b43.chart" . }}
{{ include "go-echoadb3a853-c89c-4a34-b86c-cfcca5cc8b43.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoadb3a853-c89c-4a34-b86c-cfcca5cc8b43.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoadb3a853-c89c-4a34-b86c-cfcca5cc8b43.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}