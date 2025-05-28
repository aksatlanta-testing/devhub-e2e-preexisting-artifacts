
{{- define "go-echobd5c0bb0-c120-4c1e-9ab3-14d6599e699b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobd5c0bb0-c120-4c1e-9ab3-14d6599e699b.fullname" -}}
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


{{- define "go-echobd5c0bb0-c120-4c1e-9ab3-14d6599e699b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobd5c0bb0-c120-4c1e-9ab3-14d6599e699b.labels" -}}
helm.sh/chart: {{ include "go-echobd5c0bb0-c120-4c1e-9ab3-14d6599e699b.chart" . }}
{{ include "go-echobd5c0bb0-c120-4c1e-9ab3-14d6599e699b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echobd5c0bb0-c120-4c1e-9ab3-14d6599e699b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echobd5c0bb0-c120-4c1e-9ab3-14d6599e699b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}