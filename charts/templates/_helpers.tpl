
{{- define "go-echo821af43a-fc01-40a7-9002-da45085045de.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo821af43a-fc01-40a7-9002-da45085045de.fullname" -}}
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


{{- define "go-echo821af43a-fc01-40a7-9002-da45085045de.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo821af43a-fc01-40a7-9002-da45085045de.labels" -}}
helm.sh/chart: {{ include "go-echo821af43a-fc01-40a7-9002-da45085045de.chart" . }}
{{ include "go-echo821af43a-fc01-40a7-9002-da45085045de.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo821af43a-fc01-40a7-9002-da45085045de.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo821af43a-fc01-40a7-9002-da45085045de.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}