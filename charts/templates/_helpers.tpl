
{{- define "go-echo4fd08610-60d8-4c4b-8c55-8b430faf3ddd.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo4fd08610-60d8-4c4b-8c55-8b430faf3ddd.fullname" -}}
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


{{- define "go-echo4fd08610-60d8-4c4b-8c55-8b430faf3ddd.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo4fd08610-60d8-4c4b-8c55-8b430faf3ddd.labels" -}}
helm.sh/chart: {{ include "go-echo4fd08610-60d8-4c4b-8c55-8b430faf3ddd.chart" . }}
{{ include "go-echo4fd08610-60d8-4c4b-8c55-8b430faf3ddd.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo4fd08610-60d8-4c4b-8c55-8b430faf3ddd.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo4fd08610-60d8-4c4b-8c55-8b430faf3ddd.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}