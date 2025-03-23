
{{- define "go-echoffba414b-23f6-43e1-97f2-c166673aa5fa.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoffba414b-23f6-43e1-97f2-c166673aa5fa.fullname" -}}
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


{{- define "go-echoffba414b-23f6-43e1-97f2-c166673aa5fa.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoffba414b-23f6-43e1-97f2-c166673aa5fa.labels" -}}
helm.sh/chart: {{ include "go-echoffba414b-23f6-43e1-97f2-c166673aa5fa.chart" . }}
{{ include "go-echoffba414b-23f6-43e1-97f2-c166673aa5fa.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoffba414b-23f6-43e1-97f2-c166673aa5fa.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoffba414b-23f6-43e1-97f2-c166673aa5fa.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}