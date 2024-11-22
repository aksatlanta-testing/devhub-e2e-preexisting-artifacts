
{{- define "go-echo8ae97639-181c-459a-a819-b2cdf7a80feb.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo8ae97639-181c-459a-a819-b2cdf7a80feb.fullname" -}}
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


{{- define "go-echo8ae97639-181c-459a-a819-b2cdf7a80feb.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo8ae97639-181c-459a-a819-b2cdf7a80feb.labels" -}}
helm.sh/chart: {{ include "go-echo8ae97639-181c-459a-a819-b2cdf7a80feb.chart" . }}
{{ include "go-echo8ae97639-181c-459a-a819-b2cdf7a80feb.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo8ae97639-181c-459a-a819-b2cdf7a80feb.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo8ae97639-181c-459a-a819-b2cdf7a80feb.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}