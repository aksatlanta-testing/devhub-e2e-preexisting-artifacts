
{{- define "go-echo01e98074-8c19-458f-b2d1-e9d0b208e148.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo01e98074-8c19-458f-b2d1-e9d0b208e148.fullname" -}}
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


{{- define "go-echo01e98074-8c19-458f-b2d1-e9d0b208e148.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo01e98074-8c19-458f-b2d1-e9d0b208e148.labels" -}}
helm.sh/chart: {{ include "go-echo01e98074-8c19-458f-b2d1-e9d0b208e148.chart" . }}
{{ include "go-echo01e98074-8c19-458f-b2d1-e9d0b208e148.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo01e98074-8c19-458f-b2d1-e9d0b208e148.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo01e98074-8c19-458f-b2d1-e9d0b208e148.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}