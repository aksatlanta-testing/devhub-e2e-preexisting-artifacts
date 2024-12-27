
{{- define "go-echod5a39187-29ff-4ed4-a76c-74bec9480b9a.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod5a39187-29ff-4ed4-a76c-74bec9480b9a.fullname" -}}
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


{{- define "go-echod5a39187-29ff-4ed4-a76c-74bec9480b9a.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod5a39187-29ff-4ed4-a76c-74bec9480b9a.labels" -}}
helm.sh/chart: {{ include "go-echod5a39187-29ff-4ed4-a76c-74bec9480b9a.chart" . }}
{{ include "go-echod5a39187-29ff-4ed4-a76c-74bec9480b9a.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod5a39187-29ff-4ed4-a76c-74bec9480b9a.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod5a39187-29ff-4ed4-a76c-74bec9480b9a.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}