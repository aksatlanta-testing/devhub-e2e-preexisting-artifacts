
{{- define "go-echo7ed80bb7-320a-4790-99fb-ab3a7d3cd024.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo7ed80bb7-320a-4790-99fb-ab3a7d3cd024.fullname" -}}
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


{{- define "go-echo7ed80bb7-320a-4790-99fb-ab3a7d3cd024.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo7ed80bb7-320a-4790-99fb-ab3a7d3cd024.labels" -}}
helm.sh/chart: {{ include "go-echo7ed80bb7-320a-4790-99fb-ab3a7d3cd024.chart" . }}
{{ include "go-echo7ed80bb7-320a-4790-99fb-ab3a7d3cd024.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo7ed80bb7-320a-4790-99fb-ab3a7d3cd024.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo7ed80bb7-320a-4790-99fb-ab3a7d3cd024.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}