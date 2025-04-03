
{{- define "go-echoc8a8dbce-6dbf-48b9-bfb1-a8fccbe9500b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc8a8dbce-6dbf-48b9-bfb1-a8fccbe9500b.fullname" -}}
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


{{- define "go-echoc8a8dbce-6dbf-48b9-bfb1-a8fccbe9500b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc8a8dbce-6dbf-48b9-bfb1-a8fccbe9500b.labels" -}}
helm.sh/chart: {{ include "go-echoc8a8dbce-6dbf-48b9-bfb1-a8fccbe9500b.chart" . }}
{{ include "go-echoc8a8dbce-6dbf-48b9-bfb1-a8fccbe9500b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoc8a8dbce-6dbf-48b9-bfb1-a8fccbe9500b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoc8a8dbce-6dbf-48b9-bfb1-a8fccbe9500b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}