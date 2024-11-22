
{{- define "go-echo189c4f86-0e9a-44bc-b689-5ef468812028.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo189c4f86-0e9a-44bc-b689-5ef468812028.fullname" -}}
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


{{- define "go-echo189c4f86-0e9a-44bc-b689-5ef468812028.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo189c4f86-0e9a-44bc-b689-5ef468812028.labels" -}}
helm.sh/chart: {{ include "go-echo189c4f86-0e9a-44bc-b689-5ef468812028.chart" . }}
{{ include "go-echo189c4f86-0e9a-44bc-b689-5ef468812028.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo189c4f86-0e9a-44bc-b689-5ef468812028.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo189c4f86-0e9a-44bc-b689-5ef468812028.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}