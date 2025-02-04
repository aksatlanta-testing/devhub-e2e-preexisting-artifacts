
{{- define "go-echoeeb96cee-adf7-42bb-80d8-952017d6d8ca.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoeeb96cee-adf7-42bb-80d8-952017d6d8ca.fullname" -}}
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


{{- define "go-echoeeb96cee-adf7-42bb-80d8-952017d6d8ca.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoeeb96cee-adf7-42bb-80d8-952017d6d8ca.labels" -}}
helm.sh/chart: {{ include "go-echoeeb96cee-adf7-42bb-80d8-952017d6d8ca.chart" . }}
{{ include "go-echoeeb96cee-adf7-42bb-80d8-952017d6d8ca.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoeeb96cee-adf7-42bb-80d8-952017d6d8ca.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoeeb96cee-adf7-42bb-80d8-952017d6d8ca.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}