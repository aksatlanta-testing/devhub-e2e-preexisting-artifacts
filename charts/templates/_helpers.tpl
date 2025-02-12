
{{- define "go-echob89e1e07-3340-45c5-9c69-cbec8d5f74eb.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob89e1e07-3340-45c5-9c69-cbec8d5f74eb.fullname" -}}
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


{{- define "go-echob89e1e07-3340-45c5-9c69-cbec8d5f74eb.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob89e1e07-3340-45c5-9c69-cbec8d5f74eb.labels" -}}
helm.sh/chart: {{ include "go-echob89e1e07-3340-45c5-9c69-cbec8d5f74eb.chart" . }}
{{ include "go-echob89e1e07-3340-45c5-9c69-cbec8d5f74eb.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echob89e1e07-3340-45c5-9c69-cbec8d5f74eb.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echob89e1e07-3340-45c5-9c69-cbec8d5f74eb.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}