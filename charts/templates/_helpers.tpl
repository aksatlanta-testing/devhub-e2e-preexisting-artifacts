
{{- define "go-echo4afb41bb-7c76-4884-b148-7f959410398a.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo4afb41bb-7c76-4884-b148-7f959410398a.fullname" -}}
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


{{- define "go-echo4afb41bb-7c76-4884-b148-7f959410398a.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo4afb41bb-7c76-4884-b148-7f959410398a.labels" -}}
helm.sh/chart: {{ include "go-echo4afb41bb-7c76-4884-b148-7f959410398a.chart" . }}
{{ include "go-echo4afb41bb-7c76-4884-b148-7f959410398a.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo4afb41bb-7c76-4884-b148-7f959410398a.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo4afb41bb-7c76-4884-b148-7f959410398a.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}