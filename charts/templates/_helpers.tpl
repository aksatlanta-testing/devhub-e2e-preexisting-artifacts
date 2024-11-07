
{{- define "go-echo2931c790-8dff-4b1b-8ffd-3f96cac49519.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo2931c790-8dff-4b1b-8ffd-3f96cac49519.fullname" -}}
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


{{- define "go-echo2931c790-8dff-4b1b-8ffd-3f96cac49519.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo2931c790-8dff-4b1b-8ffd-3f96cac49519.labels" -}}
helm.sh/chart: {{ include "go-echo2931c790-8dff-4b1b-8ffd-3f96cac49519.chart" . }}
{{ include "go-echo2931c790-8dff-4b1b-8ffd-3f96cac49519.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo2931c790-8dff-4b1b-8ffd-3f96cac49519.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo2931c790-8dff-4b1b-8ffd-3f96cac49519.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}