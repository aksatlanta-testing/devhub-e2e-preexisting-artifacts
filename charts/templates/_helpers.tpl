
{{- define "go-echoda0127d9-9c5f-4065-8972-aece9a9c1092.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoda0127d9-9c5f-4065-8972-aece9a9c1092.fullname" -}}
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


{{- define "go-echoda0127d9-9c5f-4065-8972-aece9a9c1092.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoda0127d9-9c5f-4065-8972-aece9a9c1092.labels" -}}
helm.sh/chart: {{ include "go-echoda0127d9-9c5f-4065-8972-aece9a9c1092.chart" . }}
{{ include "go-echoda0127d9-9c5f-4065-8972-aece9a9c1092.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoda0127d9-9c5f-4065-8972-aece9a9c1092.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoda0127d9-9c5f-4065-8972-aece9a9c1092.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}