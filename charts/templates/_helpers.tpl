
{{- define "go-echo71908b5b-1cbc-4d60-85e8-e80ad2f4d80f.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo71908b5b-1cbc-4d60-85e8-e80ad2f4d80f.fullname" -}}
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


{{- define "go-echo71908b5b-1cbc-4d60-85e8-e80ad2f4d80f.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo71908b5b-1cbc-4d60-85e8-e80ad2f4d80f.labels" -}}
helm.sh/chart: {{ include "go-echo71908b5b-1cbc-4d60-85e8-e80ad2f4d80f.chart" . }}
{{ include "go-echo71908b5b-1cbc-4d60-85e8-e80ad2f4d80f.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo71908b5b-1cbc-4d60-85e8-e80ad2f4d80f.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo71908b5b-1cbc-4d60-85e8-e80ad2f4d80f.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}