
{{- define "go-echodc24bf3a-bf84-4abe-a74f-e09575ca368f.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodc24bf3a-bf84-4abe-a74f-e09575ca368f.fullname" -}}
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


{{- define "go-echodc24bf3a-bf84-4abe-a74f-e09575ca368f.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodc24bf3a-bf84-4abe-a74f-e09575ca368f.labels" -}}
helm.sh/chart: {{ include "go-echodc24bf3a-bf84-4abe-a74f-e09575ca368f.chart" . }}
{{ include "go-echodc24bf3a-bf84-4abe-a74f-e09575ca368f.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echodc24bf3a-bf84-4abe-a74f-e09575ca368f.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echodc24bf3a-bf84-4abe-a74f-e09575ca368f.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}