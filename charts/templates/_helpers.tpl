
{{- define "go-echoee57e3cc-1bf5-49ec-9fbf-25aca3545a12.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoee57e3cc-1bf5-49ec-9fbf-25aca3545a12.fullname" -}}
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


{{- define "go-echoee57e3cc-1bf5-49ec-9fbf-25aca3545a12.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoee57e3cc-1bf5-49ec-9fbf-25aca3545a12.labels" -}}
helm.sh/chart: {{ include "go-echoee57e3cc-1bf5-49ec-9fbf-25aca3545a12.chart" . }}
{{ include "go-echoee57e3cc-1bf5-49ec-9fbf-25aca3545a12.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoee57e3cc-1bf5-49ec-9fbf-25aca3545a12.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoee57e3cc-1bf5-49ec-9fbf-25aca3545a12.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}