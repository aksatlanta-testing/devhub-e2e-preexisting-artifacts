
{{- define "go-echocf1a46e3-afd0-4553-ab3f-80012ee809ef.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocf1a46e3-afd0-4553-ab3f-80012ee809ef.fullname" -}}
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


{{- define "go-echocf1a46e3-afd0-4553-ab3f-80012ee809ef.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocf1a46e3-afd0-4553-ab3f-80012ee809ef.labels" -}}
helm.sh/chart: {{ include "go-echocf1a46e3-afd0-4553-ab3f-80012ee809ef.chart" . }}
{{ include "go-echocf1a46e3-afd0-4553-ab3f-80012ee809ef.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echocf1a46e3-afd0-4553-ab3f-80012ee809ef.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echocf1a46e3-afd0-4553-ab3f-80012ee809ef.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}