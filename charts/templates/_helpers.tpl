
{{- define "go-echof3dd17b0-25bd-42f1-be67-804c6a3317cb.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof3dd17b0-25bd-42f1-be67-804c6a3317cb.fullname" -}}
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


{{- define "go-echof3dd17b0-25bd-42f1-be67-804c6a3317cb.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof3dd17b0-25bd-42f1-be67-804c6a3317cb.labels" -}}
helm.sh/chart: {{ include "go-echof3dd17b0-25bd-42f1-be67-804c6a3317cb.chart" . }}
{{ include "go-echof3dd17b0-25bd-42f1-be67-804c6a3317cb.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof3dd17b0-25bd-42f1-be67-804c6a3317cb.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof3dd17b0-25bd-42f1-be67-804c6a3317cb.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}