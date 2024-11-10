
{{- define "go-echob8f496c5-ce59-403a-8703-a6c24d2ca940.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob8f496c5-ce59-403a-8703-a6c24d2ca940.fullname" -}}
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


{{- define "go-echob8f496c5-ce59-403a-8703-a6c24d2ca940.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob8f496c5-ce59-403a-8703-a6c24d2ca940.labels" -}}
helm.sh/chart: {{ include "go-echob8f496c5-ce59-403a-8703-a6c24d2ca940.chart" . }}
{{ include "go-echob8f496c5-ce59-403a-8703-a6c24d2ca940.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echob8f496c5-ce59-403a-8703-a6c24d2ca940.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echob8f496c5-ce59-403a-8703-a6c24d2ca940.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}