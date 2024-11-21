
{{- define "go-echob81bf124-a61d-4387-8e8f-dc7030d3f785.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob81bf124-a61d-4387-8e8f-dc7030d3f785.fullname" -}}
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


{{- define "go-echob81bf124-a61d-4387-8e8f-dc7030d3f785.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob81bf124-a61d-4387-8e8f-dc7030d3f785.labels" -}}
helm.sh/chart: {{ include "go-echob81bf124-a61d-4387-8e8f-dc7030d3f785.chart" . }}
{{ include "go-echob81bf124-a61d-4387-8e8f-dc7030d3f785.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echob81bf124-a61d-4387-8e8f-dc7030d3f785.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echob81bf124-a61d-4387-8e8f-dc7030d3f785.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}