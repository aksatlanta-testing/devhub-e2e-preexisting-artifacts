
{{- define "go-echo6391df4e-d5ec-42ef-b1fc-2938989fb78a.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo6391df4e-d5ec-42ef-b1fc-2938989fb78a.fullname" -}}
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


{{- define "go-echo6391df4e-d5ec-42ef-b1fc-2938989fb78a.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo6391df4e-d5ec-42ef-b1fc-2938989fb78a.labels" -}}
helm.sh/chart: {{ include "go-echo6391df4e-d5ec-42ef-b1fc-2938989fb78a.chart" . }}
{{ include "go-echo6391df4e-d5ec-42ef-b1fc-2938989fb78a.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo6391df4e-d5ec-42ef-b1fc-2938989fb78a.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo6391df4e-d5ec-42ef-b1fc-2938989fb78a.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}