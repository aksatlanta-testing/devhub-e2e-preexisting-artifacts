
{{- define "go-echo83d64f6a-7380-48a5-ba89-ea3ecbddef38.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo83d64f6a-7380-48a5-ba89-ea3ecbddef38.fullname" -}}
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


{{- define "go-echo83d64f6a-7380-48a5-ba89-ea3ecbddef38.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo83d64f6a-7380-48a5-ba89-ea3ecbddef38.labels" -}}
helm.sh/chart: {{ include "go-echo83d64f6a-7380-48a5-ba89-ea3ecbddef38.chart" . }}
{{ include "go-echo83d64f6a-7380-48a5-ba89-ea3ecbddef38.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo83d64f6a-7380-48a5-ba89-ea3ecbddef38.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo83d64f6a-7380-48a5-ba89-ea3ecbddef38.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}