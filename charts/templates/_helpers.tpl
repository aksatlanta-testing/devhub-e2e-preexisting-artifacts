
{{- define "go-echob07cc7a9-4504-46b0-b083-dcf0f877b8bb.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob07cc7a9-4504-46b0-b083-dcf0f877b8bb.fullname" -}}
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


{{- define "go-echob07cc7a9-4504-46b0-b083-dcf0f877b8bb.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob07cc7a9-4504-46b0-b083-dcf0f877b8bb.labels" -}}
helm.sh/chart: {{ include "go-echob07cc7a9-4504-46b0-b083-dcf0f877b8bb.chart" . }}
{{ include "go-echob07cc7a9-4504-46b0-b083-dcf0f877b8bb.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echob07cc7a9-4504-46b0-b083-dcf0f877b8bb.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echob07cc7a9-4504-46b0-b083-dcf0f877b8bb.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}