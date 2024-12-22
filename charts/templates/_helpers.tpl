
{{- define "go-echodac9120a-2a05-42f0-bebb-08e20c39cd29.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodac9120a-2a05-42f0-bebb-08e20c39cd29.fullname" -}}
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


{{- define "go-echodac9120a-2a05-42f0-bebb-08e20c39cd29.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodac9120a-2a05-42f0-bebb-08e20c39cd29.labels" -}}
helm.sh/chart: {{ include "go-echodac9120a-2a05-42f0-bebb-08e20c39cd29.chart" . }}
{{ include "go-echodac9120a-2a05-42f0-bebb-08e20c39cd29.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echodac9120a-2a05-42f0-bebb-08e20c39cd29.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echodac9120a-2a05-42f0-bebb-08e20c39cd29.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}