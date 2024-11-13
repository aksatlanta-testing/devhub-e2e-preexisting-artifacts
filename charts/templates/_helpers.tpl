
{{- define "go-echoc60e2d83-fdd7-4eaf-988d-5c8faa86a002.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc60e2d83-fdd7-4eaf-988d-5c8faa86a002.fullname" -}}
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


{{- define "go-echoc60e2d83-fdd7-4eaf-988d-5c8faa86a002.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc60e2d83-fdd7-4eaf-988d-5c8faa86a002.labels" -}}
helm.sh/chart: {{ include "go-echoc60e2d83-fdd7-4eaf-988d-5c8faa86a002.chart" . }}
{{ include "go-echoc60e2d83-fdd7-4eaf-988d-5c8faa86a002.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoc60e2d83-fdd7-4eaf-988d-5c8faa86a002.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoc60e2d83-fdd7-4eaf-988d-5c8faa86a002.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}