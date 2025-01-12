
{{- define "go-echo0977b926-9ed6-40b4-b186-9297e420c5ee.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo0977b926-9ed6-40b4-b186-9297e420c5ee.fullname" -}}
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


{{- define "go-echo0977b926-9ed6-40b4-b186-9297e420c5ee.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo0977b926-9ed6-40b4-b186-9297e420c5ee.labels" -}}
helm.sh/chart: {{ include "go-echo0977b926-9ed6-40b4-b186-9297e420c5ee.chart" . }}
{{ include "go-echo0977b926-9ed6-40b4-b186-9297e420c5ee.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo0977b926-9ed6-40b4-b186-9297e420c5ee.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo0977b926-9ed6-40b4-b186-9297e420c5ee.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}