
{{- define "go-echoa4fcbe76-6f51-4e84-a052-0126657e4d3c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa4fcbe76-6f51-4e84-a052-0126657e4d3c.fullname" -}}
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


{{- define "go-echoa4fcbe76-6f51-4e84-a052-0126657e4d3c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa4fcbe76-6f51-4e84-a052-0126657e4d3c.labels" -}}
helm.sh/chart: {{ include "go-echoa4fcbe76-6f51-4e84-a052-0126657e4d3c.chart" . }}
{{ include "go-echoa4fcbe76-6f51-4e84-a052-0126657e4d3c.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa4fcbe76-6f51-4e84-a052-0126657e4d3c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa4fcbe76-6f51-4e84-a052-0126657e4d3c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}