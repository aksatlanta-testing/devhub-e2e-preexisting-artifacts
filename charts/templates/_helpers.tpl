
{{- define "go-echo2179e6ab-45e1-41f1-9a9f-e79da823d63b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo2179e6ab-45e1-41f1-9a9f-e79da823d63b.fullname" -}}
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


{{- define "go-echo2179e6ab-45e1-41f1-9a9f-e79da823d63b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo2179e6ab-45e1-41f1-9a9f-e79da823d63b.labels" -}}
helm.sh/chart: {{ include "go-echo2179e6ab-45e1-41f1-9a9f-e79da823d63b.chart" . }}
{{ include "go-echo2179e6ab-45e1-41f1-9a9f-e79da823d63b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo2179e6ab-45e1-41f1-9a9f-e79da823d63b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo2179e6ab-45e1-41f1-9a9f-e79da823d63b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}