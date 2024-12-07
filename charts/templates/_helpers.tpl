
{{- define "go-echoc31012b3-9001-41d9-95e9-6b5124ae50e4.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc31012b3-9001-41d9-95e9-6b5124ae50e4.fullname" -}}
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


{{- define "go-echoc31012b3-9001-41d9-95e9-6b5124ae50e4.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc31012b3-9001-41d9-95e9-6b5124ae50e4.labels" -}}
helm.sh/chart: {{ include "go-echoc31012b3-9001-41d9-95e9-6b5124ae50e4.chart" . }}
{{ include "go-echoc31012b3-9001-41d9-95e9-6b5124ae50e4.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoc31012b3-9001-41d9-95e9-6b5124ae50e4.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoc31012b3-9001-41d9-95e9-6b5124ae50e4.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}