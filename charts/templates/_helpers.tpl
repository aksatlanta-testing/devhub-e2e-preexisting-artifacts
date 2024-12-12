
{{- define "go-echoc9afff27-b689-4b33-aa68-3562c99c2844.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc9afff27-b689-4b33-aa68-3562c99c2844.fullname" -}}
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


{{- define "go-echoc9afff27-b689-4b33-aa68-3562c99c2844.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc9afff27-b689-4b33-aa68-3562c99c2844.labels" -}}
helm.sh/chart: {{ include "go-echoc9afff27-b689-4b33-aa68-3562c99c2844.chart" . }}
{{ include "go-echoc9afff27-b689-4b33-aa68-3562c99c2844.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoc9afff27-b689-4b33-aa68-3562c99c2844.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoc9afff27-b689-4b33-aa68-3562c99c2844.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}