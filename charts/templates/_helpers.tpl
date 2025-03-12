
{{- define "go-echof335aaa6-2a37-448b-a03f-ea1d4366aeae.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof335aaa6-2a37-448b-a03f-ea1d4366aeae.fullname" -}}
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


{{- define "go-echof335aaa6-2a37-448b-a03f-ea1d4366aeae.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof335aaa6-2a37-448b-a03f-ea1d4366aeae.labels" -}}
helm.sh/chart: {{ include "go-echof335aaa6-2a37-448b-a03f-ea1d4366aeae.chart" . }}
{{ include "go-echof335aaa6-2a37-448b-a03f-ea1d4366aeae.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof335aaa6-2a37-448b-a03f-ea1d4366aeae.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof335aaa6-2a37-448b-a03f-ea1d4366aeae.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}