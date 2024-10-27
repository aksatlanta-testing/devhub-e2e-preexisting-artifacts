
{{- define "go-echoc65796d3-82f7-4ceb-aa10-7e566d19d81f.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc65796d3-82f7-4ceb-aa10-7e566d19d81f.fullname" -}}
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


{{- define "go-echoc65796d3-82f7-4ceb-aa10-7e566d19d81f.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc65796d3-82f7-4ceb-aa10-7e566d19d81f.labels" -}}
helm.sh/chart: {{ include "go-echoc65796d3-82f7-4ceb-aa10-7e566d19d81f.chart" . }}
{{ include "go-echoc65796d3-82f7-4ceb-aa10-7e566d19d81f.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoc65796d3-82f7-4ceb-aa10-7e566d19d81f.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoc65796d3-82f7-4ceb-aa10-7e566d19d81f.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}