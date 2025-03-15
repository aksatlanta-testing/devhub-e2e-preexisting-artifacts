
{{- define "go-echob6604f58-84c5-4653-8080-83f6d308315d.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob6604f58-84c5-4653-8080-83f6d308315d.fullname" -}}
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


{{- define "go-echob6604f58-84c5-4653-8080-83f6d308315d.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob6604f58-84c5-4653-8080-83f6d308315d.labels" -}}
helm.sh/chart: {{ include "go-echob6604f58-84c5-4653-8080-83f6d308315d.chart" . }}
{{ include "go-echob6604f58-84c5-4653-8080-83f6d308315d.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echob6604f58-84c5-4653-8080-83f6d308315d.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echob6604f58-84c5-4653-8080-83f6d308315d.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}