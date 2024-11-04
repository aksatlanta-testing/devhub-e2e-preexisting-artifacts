
{{- define "go-echocfeaac09-4856-452f-b9d8-bce5bc1652bd.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocfeaac09-4856-452f-b9d8-bce5bc1652bd.fullname" -}}
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


{{- define "go-echocfeaac09-4856-452f-b9d8-bce5bc1652bd.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocfeaac09-4856-452f-b9d8-bce5bc1652bd.labels" -}}
helm.sh/chart: {{ include "go-echocfeaac09-4856-452f-b9d8-bce5bc1652bd.chart" . }}
{{ include "go-echocfeaac09-4856-452f-b9d8-bce5bc1652bd.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echocfeaac09-4856-452f-b9d8-bce5bc1652bd.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echocfeaac09-4856-452f-b9d8-bce5bc1652bd.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}