
{{- define "go-echoba01cf69-765a-41b2-863f-ee1e5ca11101.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoba01cf69-765a-41b2-863f-ee1e5ca11101.fullname" -}}
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


{{- define "go-echoba01cf69-765a-41b2-863f-ee1e5ca11101.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoba01cf69-765a-41b2-863f-ee1e5ca11101.labels" -}}
helm.sh/chart: {{ include "go-echoba01cf69-765a-41b2-863f-ee1e5ca11101.chart" . }}
{{ include "go-echoba01cf69-765a-41b2-863f-ee1e5ca11101.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoba01cf69-765a-41b2-863f-ee1e5ca11101.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoba01cf69-765a-41b2-863f-ee1e5ca11101.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}