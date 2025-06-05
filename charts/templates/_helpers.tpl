
{{- define "go-echofa94a365-c8c1-47bf-977f-fbfc714c9400.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofa94a365-c8c1-47bf-977f-fbfc714c9400.fullname" -}}
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


{{- define "go-echofa94a365-c8c1-47bf-977f-fbfc714c9400.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofa94a365-c8c1-47bf-977f-fbfc714c9400.labels" -}}
helm.sh/chart: {{ include "go-echofa94a365-c8c1-47bf-977f-fbfc714c9400.chart" . }}
{{ include "go-echofa94a365-c8c1-47bf-977f-fbfc714c9400.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echofa94a365-c8c1-47bf-977f-fbfc714c9400.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echofa94a365-c8c1-47bf-977f-fbfc714c9400.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}