
{{- define "go-echoc57e4d3b-0c86-4677-a7ae-14bddc73c738.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc57e4d3b-0c86-4677-a7ae-14bddc73c738.fullname" -}}
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


{{- define "go-echoc57e4d3b-0c86-4677-a7ae-14bddc73c738.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc57e4d3b-0c86-4677-a7ae-14bddc73c738.labels" -}}
helm.sh/chart: {{ include "go-echoc57e4d3b-0c86-4677-a7ae-14bddc73c738.chart" . }}
{{ include "go-echoc57e4d3b-0c86-4677-a7ae-14bddc73c738.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoc57e4d3b-0c86-4677-a7ae-14bddc73c738.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoc57e4d3b-0c86-4677-a7ae-14bddc73c738.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}