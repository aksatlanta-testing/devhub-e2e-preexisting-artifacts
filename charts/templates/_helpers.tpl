
{{- define "go-echoff6bac6b-d603-40d3-9ab7-6115b236c815.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoff6bac6b-d603-40d3-9ab7-6115b236c815.fullname" -}}
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


{{- define "go-echoff6bac6b-d603-40d3-9ab7-6115b236c815.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoff6bac6b-d603-40d3-9ab7-6115b236c815.labels" -}}
helm.sh/chart: {{ include "go-echoff6bac6b-d603-40d3-9ab7-6115b236c815.chart" . }}
{{ include "go-echoff6bac6b-d603-40d3-9ab7-6115b236c815.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoff6bac6b-d603-40d3-9ab7-6115b236c815.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoff6bac6b-d603-40d3-9ab7-6115b236c815.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}