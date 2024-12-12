
{{- define "go-echoea380abf-0732-4aae-8fbe-d3ca3bf1ab9e.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoea380abf-0732-4aae-8fbe-d3ca3bf1ab9e.fullname" -}}
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


{{- define "go-echoea380abf-0732-4aae-8fbe-d3ca3bf1ab9e.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoea380abf-0732-4aae-8fbe-d3ca3bf1ab9e.labels" -}}
helm.sh/chart: {{ include "go-echoea380abf-0732-4aae-8fbe-d3ca3bf1ab9e.chart" . }}
{{ include "go-echoea380abf-0732-4aae-8fbe-d3ca3bf1ab9e.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoea380abf-0732-4aae-8fbe-d3ca3bf1ab9e.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoea380abf-0732-4aae-8fbe-d3ca3bf1ab9e.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}